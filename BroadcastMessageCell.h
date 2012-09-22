//
//  BroadcastMessageCell.h
//  tabbar
//
//  Created by ji jiandong on 3/29/12.
//  Copyright 2012 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BroadcastMessageCell : UITableViewCell {
    UIImageView     *userHeadImage_;                 //用户头像
    UILabel         *userName_;                      //用户姓名
    UILabel         *releaseMessageTime_;            //消息发布时间
    UILabel         *mySpeech_;                      //发布的内容
    UILabel         *othersSpeech_;                  //微博被转发的原文内容
    UILabel         *from_;                          //来自
    UILabel         *whereFrom_;                     //微博来自哪里（来自iphone等等）
    UILabel         *manyTransmit_;                  //有转发的数目
    UILabel         *manyComment_;                   //有评论的数目
}

@property (nonatomic, retain)IBOutlet UIImageView *userHeadImage;
@property (nonatomic, retain)IBOutlet UILabel *userName;
@property (nonatomic, retain)IBOutlet UILabel *releaseMessageTime;
@property (nonatomic, retain)IBOutlet UILabel *mySpeech;
@property (nonatomic, retain)IBOutlet UILabel *othersSppech;
@property (nonatomic, retain)IBOutlet UILabel *from;
@property (nonatomic, retain)IBOutlet UILabel *whereFrom;
@property (nonatomic, retain)IBOutlet UILabel *manyTransmit;
@property (nonatomic, retain)IBOutlet UILabel *manyComment;



@end
