//
//  MailListCell.h
//  MailList
//
//  Created by MacMini on 16/2/25.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MailListFrame;

@interface MailListCell : UITableViewCell

@property (nonatomic,assign) BOOL isSelected;

@property (nonatomic, strong) MailListFrame *mailframe;


@end
