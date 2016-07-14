//
//  Person.h
//  KvcAndKvoTest
//
//  Created by 周海 on 16/7/14.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Student;
@interface Person : UIButton
{
    NSString *_address;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) Student *student;
@end
