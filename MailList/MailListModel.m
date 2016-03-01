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

//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super init];
//    if (self) {
//        _email = [coder decodeObjectForKey:@"email"];
//        
//    }
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)aCoder
//{
//    [aCoder encodeObject:_email forKey:@"email"];
//}

- (NSDictionary *)dictionaryValue
{
    return @{@"email":_email,@"name":_name,@"phone":_phone};
}
@end
