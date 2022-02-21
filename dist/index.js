"use strict";
/*
 * @Author: Yoney Y (YuTianyuan)
 * @Date: 2022-02-08 02:44:49
 * @Last Modified by: YoneyY (YuTianyuan)
 * @Last Modified time: 2022-02-22 02:43:38
 */
Object.defineProperty(exports, "__esModule", { value: true });
const w = require('bindings')('bf-wchat');
class WeWorkChat {
    corpid;
    secret;
    private_key;
    constructor(options) {
        if (options.corpid == null)
            throw new Error('`corpid` must be required!');
        if (options.secret == null)
            throw new Error('`secret` must be required!');
        if (options.private_key == null)
            throw new Error('`private_key` must be required!');
        this.corpid = options.corpid;
        this.secret = options.secret;
        this.private_key = options.private_key;
        this.init();
    }
    /**
     * init
     * @description Initialize WeWork Chat SDK
     * @author Yoneyy(YuTianYuan)
     * @date 2022-02-07
     * @private
     */
    init() {
        w.init(this.corpid, this.secret);
    }
    /**
     * 获取会话列表
     * Get chat data list
     * @param params
     * ```ts
     *  {
     *      seq: number;
     *      limit: number;
     *      proxy?: string;
     *      passwd?: string;
     *      timeout: number;
     *  }
     * ```
     * @author Yoneyy(YuTianYuan)
     * @date 2022-02-07
     * @returns
     */
    getChatData(params) {
        if (params.proxy == null)
            params.proxy = '';
        if (params.passwd == null)
            params.passwd = '';
        const result = w.getChatDatas(params);
        const res = JSON.parse(result);
        return Promise.resolve(res);
    }
    /**
     * RSA解密
     * @param encrypt_random_key 从`getChatData`数据列表的每个元素中获取 `encrypt_random_key`
     * @author Yoneyy(YuTianYuan)
     * @date 2022-02-07
     * @returns
     */
    deRSAcryptChatData(encrypt_random_key) {
        const result = w.deRSAcryptChatData(encrypt_random_key, this.private_key);
        return Promise.resolve(result);
    }
    /**
     * Chat content decryption
     * @param encrypt_key 从`deRSAcryptChatData`获取的`encrypt_key`
     * @param encrypt_msg 从`getChatData`数据列表的每个元素中获取 `encrypt_chat_msg`
     * @author Yoneyy(YuTianYuan)
     * @date 2022-02-07
     * @returns
     */
    deCryptDatas(encrypt_key, encrypt_msg) {
        const result = w.deCryptDatas(encrypt_key, encrypt_msg);
        const res = JSON.parse(result);
        return Promise.resolve(res);
    }
}
exports.default = WeWorkChat;
