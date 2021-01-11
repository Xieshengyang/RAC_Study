//
//  UIView+Category.h
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Category)
@property(nonatomic, copy, readonly)UIView *(^FrameBlock)(CGRect);
@property(nonatomic, copy, readonly)UIView *(^ColorBlock)(UIColor *);
// block作为block的参数
@property(nonatomic, copy, readonly)UIView *(^TapBLock)(void(^handle)(void));
@end

NS_ASSUME_NONNULL_END
