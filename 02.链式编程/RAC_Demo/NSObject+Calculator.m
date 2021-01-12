//
//  NSObject+Calculator.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import "NSObject+Calculator.h"
#import "CalculatorMaker.h"

@implementation NSObject (Calculator)
+ (NSInteger)makeCalcutor:(void(^)(CalculatorMaker *maker))maker {
    CalculatorMaker *maker_ = [CalculatorMaker new];
    maker(maker_);
    return maker_.result;
}
@end
