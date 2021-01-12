//
//  Calculator.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import "Calculator.h"

@implementation Calculator

- (instancetype)makeCalculate:(NSInteger(^)(NSInteger))calculate {
    _result = calculate(self.result);
    return self;
}
@end
