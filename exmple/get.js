const BFWchat = require('../dist/index').default;

// your RSA private key
const private_key = `
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAvsFopMih+xeS6v1FMIM4i0g4KAByrVGVFWaK4gWW+tzyAslh
EfAvhcUURjYuF3M5OhoLEiOnK+Am7DzQzynq641PAl70912vR7/RRNPwwuOQR1g4
mOnX4Y2xkrh+nN3zEwVPDS5g32XG4Qlo+T2+6psLuCpaBM+B+YDzeOOxlygsb3Pb
3cT9o57yZEZIs3AZDEQLZrGhO0Y1TJRaaHWLPJxGrtc3FhBibxbOkIaY3Gl5zAJv
aVorSJeauMIjbSD0n+zFXo92YcLmuchRtQJCfumOD1jvgXkK3cvKb5TWyeoSSx18
5uaNXmymH/4AymP+rY0rg+H6YjHE7z8cjMj3DQIDAQABAoIBABXS9u/zbGTX2507
ANF+EdgNmS8qbfRaYx4hrz4QuadV4/Jhq9NrkWRSmfE2fat9KUz2cdHPdm7UpF9e
zd0FxLTSY/m3d3tdopIo5f5j6SXC91zSQRdtmZ9aoLhSl1nHIupILzUo2zhz4n8Y
noP1hoQ83OhjIA1w2EP9dt2b31OVuCmXPyAtUZwSNtcef6/LFyiFC2p+13ZgfTyj
BTlc2hlVqYZCafZbxYGHUFIpEH2B9EHHphW2iXf7kNLBxKKfm0AEUfJIIsI9ktUa
Z7DC1+NA773aeM6Q/D4R0wKBgQCB732GK/Qk9upOFrtqDHr/bpHcn5GnPZgyUTgv
O5trbwIfd57Yy9nY0knEa1W90Du57Mamn+c2NplhKKTnh1jDVsm8op7IeUy+PpJ4
u4J8Igr9xGju6QQO8+lCyx9HxTREHpq7eIUdEb7Z6o3w4mwr/CBTg9j5MvZUgqib
8ZC1RwKBgQDOyxG7BF47AO0UeJqobBoruvWzG8Aa8dAlifAm3IWglljWxbU2xZYI
tXlupHg1TZkWWQU3M3GPySCZCkJJdxLPyMdx/qPzlfr4TU2eJ0secxDgnp+n+L+Y
fOFkJ6nhtLm61i3vgrX8yQh+sVzv8jzqzpYGUbz7AjcTInYF2h0N/Q==
-----END RSA PRIVATE KEY-----
`;

// Initialize WeWork Chat SDK
const bf_wchat = new BFWchat({
  corpid: 'your corpid of Wework',
  secret: 'your secret of Wework',
  private_key
});

async function main() {
  
  // Get chat data list
  const chat_list = await bf_wchat.getChatData({
    seq: 839,
    limit: 2,
    timeout: 5
  });
  console.log(chat_list);

  // Obtain the encrypt_key through RSA decryption
  const encrypt_key = await bf_wchat.deRSAcryptChatData(chat_list['chatdata'][1]['encrypt_random_key']);
  console.log(encrypt_key);

  // Decrypt the chat content by the obtained encrypt_key
  const content = await bf_wchat.deCryptDatas(encrypt_key, chat_list['chatdata'][1]['encrypt_chat_msg']);
  console.log(content);
}

main().catch(console.log);