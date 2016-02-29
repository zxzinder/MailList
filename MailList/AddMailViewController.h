//
//  AddMailViewController.h
//  MailList
//
//  Created by MacMini on 16/2/26.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MailListModel;

@protocol passValue <NSObject>

-(void)passMailValue:(MailListModel *)mailList;

@end

@interface AddMailViewController : UIViewController

@property (nonatomic, weak) id <passValue> delegate;

@end
