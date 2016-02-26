//
//  MailListFrame.m
//  MailList
//
//  Created by MacMini on 16/2/25.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import "MailListFrame.h"
#import "MailListModel.h"


@implementation MailListFrame

-(void)setMailList:(MailListModel *)mailList{
    
    CGFloat padding = 10;
    
    _mailList = mailList;
   
    CGFloat nameX = padding;
    CGFloat nameY = padding;
    CGFloat nameW = 100;
    CGFloat nameH = 30;
    CGRect nameFrame =  CGRectMake(nameX, nameY, nameW, nameH);
    _nameF = nameFrame;
    
    CGFloat phoneIconX = nameX;
    CGFloat phoneIconY = CGRectGetMaxY(nameFrame) + padding;
    CGFloat phoneIconW = 15;
    CGFloat phoneIconH = 15;
    _phoneIconF = CGRectMake(phoneIconX, phoneIconY, phoneIconW, phoneIconH);
    
    CGFloat phoneX = padding + phoneIconW ;
    CGFloat phoneY = CGRectGetMaxY(nameFrame) + padding;
    CGFloat phoneW = 150;
    CGFloat phoneH = 15;
    _phoneF = CGRectMake(phoneX, phoneY, phoneW, phoneH);
    
    CGFloat middleViewW = 1;
    CGFloat middleViewH = 15;
    CGFloat middleViewX = [UIScreen mainScreen].bounds.size.width / 2;
    CGFloat middleViewY = phoneIconY;
    _middleViewF = CGRectMake(middleViewX, middleViewY, middleViewW, middleViewH);
    
   
  
    CGFloat emailIconW = 15;
    CGFloat emailIconH = 15;
    CGFloat emailIconX = CGRectGetMaxX(_middleViewF) + padding;
    CGFloat emailIconY = phoneIconY;
    
    _emailIconF = CGRectMake(emailIconX, emailIconY, emailIconW, emailIconH);
   
    
    CGFloat emailW = 150;
    CGFloat emailH = 15;
    CGFloat emailX = padding + CGRectGetMaxX(_emailIconF) ;
    CGFloat emailY = phoneY;
    
    _emailF = CGRectMake(emailX, emailY, emailW, emailH);
    
    _cellHeight = CGRectGetMaxY(_phoneIconF) + padding;
    
}

+(NSArray *)MailListFrames{
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil]];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        MailListFrame *frame = [[MailListFrame alloc ] init];
        
        MailListModel *mailList = [MailListModel MailListWithDict:dict];
        
        frame.mailList = mailList;
        
        [arrM addObject:frame];
    }
    return arrM;
}

@end
