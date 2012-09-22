//
//  MyBroadCastCell.h
//  tabbar
//
//  Created by ji jijiandong on 12-5-9.
//  Copyright 2012年 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyBroadCastCell : UITableViewCell {
    UILabel *userNameLabel_;    //主人姓名
    UILabel *releaseTimeLabel_;  //消息发布时间
    UILabel *mySpeechLabel_;     //主人说的内容
    UILabel *otherSpeechLabel_;  //转载的内容
    UILabel *from_;              //来自标签
    UILabel *whereFrom_;          //来自何处标签 
    UILabel *transmitLabel_;     //转载次数标签
    UILabel *commentLabel_;      //评论次数标签
}

@property (nonatomic, retain) IBOutlet UILabel *userNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *releaseTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *mySpeechLabel;
@property (nonatomic, retain) IBOutlet UILabel *otherSpeechLabel;
@property (nonatomic, retain) IBOutlet UILabel *from;
@property (nonatomic, retain) IBOutlet UILabel *whereFrom;
@property (nonatomic, retain) IBOutlet UILabel *transmitLabel;
@property (nonatomic, retain) IBOutlet UILabel *commentLabel;


@end
