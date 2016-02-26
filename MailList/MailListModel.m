//
//  MailListModel.m
//  MailList
//
//  Created by MacMini on 16/2/25.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import "MailListModel.h"

@implementation MailListModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)MailListWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


@end
