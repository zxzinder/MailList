//
//  MailListFrame.h
//  MailList
//
//  Created by MacMini on 16/2/25.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MailListModel;

@interface MailListFrame : NSObject

@property (nonatomic, assign,readonly) CGRect nameF;

@property (nonatomic,assign,readonly) CGRect emailIconF;

@property (nonatomic,assign,readonly) CGRect emailF;

@property (nonatomic,assign,readonly) CGRect phoneIconF;

@property (nonatomic,assign,readonly) CGRect phoneF;

@property (nonatomic,assign,readonly) CGRect middleViewF;

@property (nonatomic,assign,readonly) CGRect hideViewF;

@property (nonatomic,assign,readonly) CGFloat cellHeight;

@property (nonatomic, strong) MailListModel *mailList;

+(NSMutableArray *)MailListFrames;
@end
