const We = require('../dist/index').default;

const private_key = `
-----BEGIN RSA PRIVATE KEY-----
MIICXgIBAAKBgQC6QebGUVX1UFvnAIHNsn374gZCl78wqOVf8irGNBokNfL4STs7
LsswdFQy4sOk7LjObEEOntoyemHIoa1TGQs9rSsgSAoRuX+b3afyuRRvSL+J7eAf
uuIBPQQUh24FjAmCceJ34HKqRcVEOga3AX41LASTXCscfQfiuSiUteVMqQIDAQAB
AoGADB+Tf5eWNn45SScri8HBOQasfSOm7moj6fOXjKiiBfbb/oS3vgGs+JWt0FUZ
wm+lFMyPjH3S+oOkPzykzTqdVFT78XJpFYpyAIln3FMBPNvTT/OMq6XDhYUIxHP9
I3a1aaw88sjh45whdLNoU6EE/pgQ7Sxdk21K6/ZlcvRb50ECQQD38wJuXyOuWYFv
cU2cUmljl0D1ldTsTC3Rd3hgMs237YoRcxAx+Rloxzub25LbdcU/AWQe12eFyadn
Y3V5ZG1JAkEAwE4Zt9k7lBSn05D+3qQOBeoFIjOvf1+DHphywkyUZIH4IKoJRsMc
tQUQtnjbD+VSpqGPJxPGjrWv4+/M1czEYQJBAKtyOQggeQehlEJ+0e95fK4EdEJc
LDKIKlZgibfa6Sx477NJILWtTMiKmskWduGQ+aarS5OX1llIKpzuxNf/fSECQQCS
+R3ezUAjpMW/hInGT0wIaRsTUL1IdA8aSxkqNq0TQ+IH1OzSEDzYfM6RJz0FoRbS
E5f9HbgbSfDsHFJI9P8BAkEAjVBRbmRxiWBF7DCyFQtJ4I1e4zcOiZFIAuFWRfoV
4OEzK42SKE9GBnglkZJ7+LmVDD6UivF2Rs+Eu80j+gsl7w==
-----END RSA PRIVATE KEY-----
`;

const we = new We({
  corpid: 'ww4c808edd7916ad78',
  secret: 'mo7lza3YYFPXFPJRHLJpifkmYth8lwLNdH3eOoaAhV8',
  private_key
});

async function main() {
  const chat_list = await we.getChatData({
    seq: 839,
    limit: 2,
    timeout: 5
  });
  console.log(chat_list);

  const encrypt_key = await we.deRSAcryptChatData(chat_list['chatdata'][1]['encrypt_random_key']);
  console.log(encrypt_key);

  const content = await we.deCryptDatas(encrypt_key, chat_list['chatdata'][1]['encrypt_chat_msg']);
  console.log(content);
}

main().catch(console.log);