//
//  MailListModel.h
//  MailList
//
//  Created by MacMini on 16/2/25.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MailListModel : NSObject

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *phone;

- (instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)MailListWithDict:(NSDictionary *)dict;

@end
