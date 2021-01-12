//
//  ViewController.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/11.
//

#import "ViewController.h"
#import "UIView+Category.h"
#import "UIButton+Category.h"
#import "CalculatorMaker.h"
#import "NSObject+Calculator.h"

@interface ViewController ()
@property(nonatomic, copy)void(^myBlock)(void);
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    链式编程思想：是将多个操作（多行代码）通过点号(.)链接在一起成为一句代码,使代码可读性好。a(1).b(2).c(3)
    链式编程特点：方法的返回值是block,block必须有返回值（本身对象），block参数（需要操作的值）
     */
    
    UIView *redView = UIView.Creat().SetFrame(CGRectMake(60, 90, 90, 90)).SetBackGroundColor(UIColor.redColor);
    [self.view addSubview:redView];

    NSInteger result = [NSObject makeCalcutor:^(CalculatorMaker * _Nonnull maker) {
         maker.add(444).minus(111);
    }];
    NSLog(@"result = %zd", result);
    
}

- (void)btnClick:(UIButton *)sender {
    
}

@end
