//
//  ViewController.m
//  KvcAndKvoTest
//
//  Created by 周海 on 16/7/14.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"
@interface ViewController ()
{
    NSString *_address;
    Person *_p;
    int i;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _p = [[Person alloc] init];
    
    //----------------------------KVC的应用---------------------------------------------
    
//    [p setValue:@"周浩" forKey:@"name"];
//    [p setValue:@18 forKey:@"age"];
    
    [_p setValue:@"75.0" forKeyPath:@"student.score"];
    [_p setValuesForKeysWithDictionary:@{@"name":@"周海",@"age":@"18"}];
    [self setValue:@"贵州" forKey:@"address"];
    
    NSLog(@"name:%@,age:%ld,address：%@,score==%@",_p.name,_p.age,_address,_p.student.score);
    
    
    //----------------------------KVO的应用---------------------------------------------
    
    
    [_p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:@"hahaha"];
    [_p addObserver:self forKeyPath:@"student.score" options:NSKeyValueObservingOptionNew context:nil];
    i= (int)_p.age;
}
- (IBAction)changeValue:(id)sender {
    i++;
    _p.age = i;
    _p.student.score = [NSString stringWithFormat:@"%d",i+100];
     NSLog(@"age:%ld,",_p.age);
}

#pragma mark - 重写observerValueForKeyPath 方法,当这个字改变时候获得通知
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{

    NSLog(@"=====================");
    NSLog(@"%@",keyPath);
     NSLog(@"=====================");
    NSLog(@"%@",object);
     NSLog(@"=====================");
    NSLog(@"%@",change);
     NSLog(@"=====================");
    NSLog(@"%@",context);
}
#pragma mark - 重写销毁方法
- (void)dealloc{
    [self removeObserver:self forKeyPath:@"student.score"];
    [self removeObserver:self forKeyPath:@"age"];
}

@end
