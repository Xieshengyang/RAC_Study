//
//  NSObject+Calculator.h
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CalculatorMaker;

@interface NSObject (Calculator)
+ (NSInteger)makeCalcutor:(void(^)(CalculatorMaker *maker))maker;
@end

NS_ASSUME_NONNULL_END
