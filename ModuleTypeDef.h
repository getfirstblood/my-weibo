//
//  ModuleTypeDef.h
//  tabbar
//
//  Created by 伟伟 高 on 12-5-12.
//  Copyright (c) 2012年 cienet. All rights reserved.
//

#ifndef tabbar_ModuleTypeDef_h
#define tabbar_ModuleTypeDef_h
//由业务模块id与相应模块的某个能力id组合成一个唯一的业务调用id
//32位业务调用id = 模块id（高16位）＋ 能力id（低16位）
#define MakeID(x, y) (((x)<<16) + (y))

//从32位业务调用id中分离模块id
#define ModuleID(x) ((x)>>16)

//从32位业务调用id中分离能力id
#define CapabilityID(x) (((x)<<16)>>16)


//业务模块
enum TModuleID {
    //主页微博请求模块
    time_line = 1,
    weibo_Relation,
    account_Relation,
    relation_List,
    private_Letter,
    search_Relation,
    trend,
    data_Update,
    data_Store,
    talk_Relation,
    tag_Relation,
    list,
    weiqun,
    lbs,
    other
    //
};
enum Ttime_lineModuleCapability{
    home_timeline = 1,
    user_timeline,
    mentions_timeline,
    headdownload,
    headdownload2,
    headdownload3
};
enum TweiboRelationCapability{
    add = 1,
    addpic,
    del,
    re_list,
    re_add,
    commentt
};
enum TdatastoreCapability{
    addt = 1,
    delt,
    list_t
};
enum TaccountRelationCapability{
    info = 1,
    update,
    head
};
#endif
