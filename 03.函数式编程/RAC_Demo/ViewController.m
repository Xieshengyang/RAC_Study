//
//  ViewController.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/11.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    函数式编程思想：是把操作尽量写成一系列嵌套的函数或者方法调用。
    函数式编程特点：每个方法必须有返回值（本身对象）,把函数或者Block当做参数,block参数作为需要操作的值，block返回值作为操作结果
     */
    
    Calculator *c = [Calculator new];
    [c makeCalculate:^NSInteger(NSInteger value) {
        value += 33;
        value += 44;
        return value;
    }];
    
    NSLog(@"result = %zd", c.result);
}


@end
