declare namespace WeWorkChat {
    interface WeWorkChatInit {
        corpid: string;
        secret: string;
        private_key: string;
    }
    interface GetChatDatasReturnMember {
        errcode: number;
        errmsg: string;
        chatdata: Array<{
            seq: number;
            msgid: string;
            publickey_ver: number;
            encrypt_random_key: string;
            encrypt_chat_msg: string;
        }>;
    }
}
declare class WeWorkChat {
    private corpid;
    private secret;
    private private_key;
    constructor(options: WeWorkChat.WeWorkChatInit);
    /**
     * init
     * @description Initialize WeWork Chat SDK
     * @author Yoneyy(YuTianYuan)
     * @date 2022-02-07
     * @private
     */
    private init;
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
    getChatData(params: {
        seq: number;
        limit: number;
        proxy?: string;
        passwd?: string;
        timeout: number;
    }): Promise<WeWorkChat.GetChatDatasReturnMember>;
    /**
     * RSA解密
     * @param encrypt_random_key 从`getChatData`数据列表的每个元素中获取 `encrypt_random_key`
     * @author Yoneyy(YuTianYuan)
     * @date 2022-02-07
     * @returns
     */
    deRSAcryptChatData(encrypt_random_key: string): Promise<string>;
    /**
     * Chat content decryption
     * @param encrypt_key 从`deRSAcryptChatData`获取的`encrypt_key`
     * @param encrypt_msg 从`getChatData`数据列表的每个元素中获取 `encrypt_chat_msg`
     * @author Yoneyy(YuTianYuan)
     * @date 2022-02-07
     * @returns
     */
    deCryptDatas(encrypt_key: string, encrypt_msg: string): Promise<Record<string, unknown>>;
}

export = WeWorkChat;