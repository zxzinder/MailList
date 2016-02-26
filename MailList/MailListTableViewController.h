//
//  MailListTableViewController.h
//  MailList
//
//  Created by MacMini on 16/2/25.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MailListModel;

@interface MailListTableViewController : UITableViewController

@property (nonatomic, strong) MailListModel *mailList;

@end
