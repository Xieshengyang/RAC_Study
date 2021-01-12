//
//  UIView+Category.h
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Category)

@property(nonatomic, copy, readonly, class)UIView *(^Creat)(void);
@property(nonatomic, copy, readonly)UIView *(^SetFrame)(CGRect);
@property(nonatomic, copy, readonly)UIView *(^SetBackGroundColor)(UIColor *);
@property(nonatomic, copy, readonly)UIView *(^AddSubView)(UIView *);

@end

NS_ASSUME_NONNULL_END
