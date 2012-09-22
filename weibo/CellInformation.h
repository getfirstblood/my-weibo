//
//  CellInformation.h
//  tabbar
//
//  Created by ji jiandong on 4/5/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CellInformation : NSObject {
    UIImage        *headImage_;            //头像图片
    NSString       *userName_;             //用户名
    NSString       *broadcastTime_;        //微博发布时间
    NSString       *mySpeech_;             //用户微博内容
    NSString       *othersSpeech_;         //好友微博内容
    NSString       *from_;                 //微博来自
    NSString       *tramitCount_;          //微博转发次数
    NSString       *commentCount_;         //微博评论次数
    
}
@property (nonatomic, retain) UIImage        *headImage;
@property (nonatomic, copy)   NSString       *userName;
@property (nonatomic, copy)   NSString       *broadcastTime;
@property (nonatomic, copy)   NSString       *mySpeech;
@property (nonatomic, copy)   NSString       *othersSpeech;
@property (nonatomic, copy)   NSString       *from;
@property (nonatomic, copy)   NSString       *tramitCount;
@property (nonatomic, copy)   NSString       *commentCount;

@end
