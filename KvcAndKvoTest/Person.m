//
//  Person.m
//  KvcAndKvoTest
//
//  Created by 周海 on 16/7/14.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "Person.h"
#import "Student.h"
@implementation Person
- (instancetype)init{
    self = [super init];
    if (self) {
        self.student = [[Student alloc] init];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
