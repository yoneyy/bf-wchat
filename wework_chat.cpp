/*
 * @Author: Yoney Y (YuTianyuan) 
 * @Date: 2022-02-08 09:21:09 
 * @Last Modified by: YoneyY (YuTianyuan)
 * @Last Modified time: 2022-02-08 18:19:16
 */

#include <napi.h>
#include <iostream>
#include "openssl/rsa.h"
#include "openssl/pem.h"
#include "include/WeWorkFinanceSdk_C.h"
#include "include/rapidjson/writer.h"
#include "include/rapidjson/document.h"
#include "include/rapidjson/stringbuffer.h"

using namespace std;
using namespace Napi;

WeWorkFinanceSdk_t *sdk = NewSdk();

static const char reverse_table[128] = {
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64,
    64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 62, 64, 64, 64, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 64, 64, 64, 64, 64, 64,
    64, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 64, 64, 64, 64, 64,
    64, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 64, 64, 64, 64, 64};

/**
 * @brief Initialize WeWork Chat SDK
 *
 * @param info  js/ts data type: corpid:string secret:string;
 * @return Number
 */
Number WeWorkChatInit(const CallbackInfo &info)
{
  // Get input params
  string corpid_t = info[0].As<Napi::String>().Utf8Value();
  string secret_t = info[1].As<Napi::String>().Utf8Value();
  const char *corpid = corpid_t.data();
  const char *secret = secret_t.data();

  // init sdk
  int result = Init(sdk, corpid, secret);

  return Number::New(info.Env(), (double)result);
}

/**
 * @brief Get the Chat Datas object
 *
 * @param info  js/ts data type: {seq: number; limit: number; timeout: number; proxy: string; passwd: string;}
 * @return String
 */
String GetChatDatas(const CallbackInfo &info)
{

  Object params = info[0].As<Napi::Object>();

  int seq_t = params.Get("seq").ToNumber();
  int limit_t = params.Get("limit").ToNumber();
  int timeout_t = params.Get("timeout").ToNumber();
  string proxy_t = params.Get("proxy").ToString();
  string passwd_t = params.Get("passwd").ToString();

  // unsigned long long seq = seq_f;
  // unsigned int limit = limit_f;
  // const char *proxy = proxy_f.data();
  // const char *passwd = passwd_f.data();

  // 申请内存创建分片
  Slice_t *chatDatas = NewSlice();

  // 临时存储
  String chatList;

  // 获取会话列表（需解密）
  int ret = GetChatData(
      sdk,
      seq_t,
      limit_t,
      proxy_t.data(),
      passwd_t.data(),
      timeout_t,
      chatDatas);

  if (ret != 0)
  {
    FreeSlice(chatDatas);
    return String::New(info.Env(), "{\"error\": \"发生错误\"}");
  }

  rapidjson::Document i_json;
  i_json.Parse(chatDatas->buf);

  rapidjson::Value i_json_value;
  i_json_value = chatDatas->len;

  i_json.AddMember("total", i_json_value, i_json.GetAllocator());

  rapidjson::StringBuffer i_json_buffer;
  rapidjson::Writer<rapidjson::StringBuffer> i_json_writer(i_json_buffer);
  i_json.Accept(i_json_writer);

  chatList = String::New(info.Env(), i_json_buffer.GetString());

  // 释放内存
  FreeSlice(chatDatas);

  // 返回chat list
  return chatList;
}

/**
 * @brief Chat content decryption
 *
 * @param info js/ts data type: encrypt_key:string encrypt_msg:string
 * @return String
 */
String DecryptDatas(const CallbackInfo &info)
{
  string encrypt_key_t = info[0].As<Napi::String>().Utf8Value();
  string encrypt_msg_t = info[1].As<Napi::String>().Utf8Value();
  const char *encrypt_key = encrypt_key_t.data();
  const char *encrypt_msg = encrypt_msg_t.data();

  // 申请内存创建分片
  Slice_t *chatMsg = NewSlice();
  // 临时存储
  String chatLaws;

  int ret = DecryptData(encrypt_key, encrypt_msg, chatMsg);

  if (ret != 0)
  {
    FreeSlice(chatMsg);
    return String::New(info.Env(), "{\"error\": \"错误\"}");
  }

  chatLaws = String::New(info.Env(), chatMsg->buf);

  // 释放内存
  FreeSlice(chatMsg);

  return chatLaws;
}

string decode64(const string &ascdata)
{

  string retval;
  const string::const_iterator last = ascdata.end();
  int bits_collected = 0;
  unsigned int accumulator = 0;

  for (string::const_iterator i = ascdata.begin(); i != last; ++i)
  {
    const int c = *i;
    if (isspace(c) || c == '=')
    {
      continue;
    }
    if ((c > 127) || (c < 0) || (reverse_table[c] > 63))
    {
      return "";
    }
    accumulator = (accumulator << 6) | reverse_table[c];
    bits_collected += 6;
    if (bits_collected >= 8)
    {
      bits_collected -= 8;
      retval += static_cast<char>((accumulator >> bits_collected) & 0xffu);
    }
  }
  return retval;
}

string rsa_pri_decrypt(const string &cipherText, const char *priKey)
{
  string random_key = decode64(cipherText);

  string strRet;
  RSA *rsa = RSA_new();
  BIO *bio;
  bio = BIO_new_mem_buf(priKey, -1);

  rsa = PEM_read_bio_RSAPrivateKey(bio, &rsa, NULL, NULL);
  if (rsa == NULL)
  {
    return "";
  }
  int len = RSA_size(rsa);
  char *decryptedText = (char *)malloc(len + 1);
  memset(decryptedText, 0, len + 1);

  // 解密函数
  int ret = RSA_private_decrypt(random_key.length(), (const unsigned char *)random_key.c_str(), (unsigned char *)decryptedText, rsa, RSA_PKCS1_PADDING);
  if (ret >= 0)
    strRet = string(decryptedText, ret);

  // 释放内存
  free(decryptedText);
  BIO_free_all(bio);
  RSA_free(rsa);

  return strRet;
}

/**
 * @brief RSA 解密获取encrypt_key
 *
 * @param info encrypt_random_key private_key
 * @return String
 */
String DeRSAcryptChatData(const CallbackInfo &info)
{
  string encrypt_random_key_t = info[0].As<Napi::String>().Utf8Value();
  string private_key_t = info[1].As<Napi::String>().Utf8Value();
  const char *encrypt_random_key = encrypt_random_key_t.data();
  const char *private_key = private_key_t.data();

  string ret = rsa_pri_decrypt(encrypt_random_key, private_key);

  return String::New(info.Env(), ret);
}

// Initialize Nodejs Module
Object NodeModuleInit(Env env, Object exports)
{
  exports.Set("init", Function::New(env, WeWorkChatInit));
  exports.Set("getChatDatas", Function::New(env, GetChatDatas));
  exports.Set("deCryptDatas", Function::New(env, DecryptDatas));
  exports.Set("deRSAcryptChatData", Function::New(env, DeRSAcryptChatData));
  return exports;
}

NODE_API_MODULE(addon, NodeModuleInit)
