//
//  Calculator.h
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject
@property(nonatomic, assign, readonly)NSInteger result;
- (instancetype)makeCalculate:(NSInteger(^)(NSInteger))calculate;
@end

NS_ASSUME_NONNULL_END
