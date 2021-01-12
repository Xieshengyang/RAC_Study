//
//  CalculatorMaker.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import "CalculatorMaker.h"

@implementation CalculatorMaker

- (CalculatorMaker * _Nonnull (^)(NSInteger))add {
    return ^CalculatorMaker *(NSInteger value) {
        self->_result += value;
        return self;
    };
}

- (CalculatorMaker * _Nonnull (^)(NSInteger))minus {
    return ^CalculatorMaker *(NSInteger value){
        self->_result -= value;
        return self;
    };
}

@end
