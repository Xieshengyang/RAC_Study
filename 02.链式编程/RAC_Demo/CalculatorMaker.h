//
//  CalculatorMaker.h
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorMaker : NSObject

@property(nonatomic, assign, readonly)NSInteger result;
@property(nonatomic, copy, readonly)CalculatorMaker *(^add)(NSInteger);
@property(nonatomic, copy, readonly)CalculatorMaker *(^minus)(NSInteger);
@end

NS_ASSUME_NONNULL_END
