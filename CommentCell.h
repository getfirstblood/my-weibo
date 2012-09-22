//
//  CommentCell.h
//  tabbar
//
//  Created by ji jijiandong on 12-5-23.
//  Copyright 2012年 cienet. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CommentCell : UITableViewCell {
    UILabel *commentUserNameLabel_;  //评论人姓名
    UILabel *commentContentLabel_;   //评论内容
    UILabel *commentTimeLabel_;      //评论时间
}

@property (nonatomic, retain)IBOutlet UILabel *commentUserNameLabel;
@property (nonatomic, retain)IBOutlet UILabel *commentContentLabel;
@property (nonatomic, retain)IBOutlet UILabel *commentTimeLabel;

@end
