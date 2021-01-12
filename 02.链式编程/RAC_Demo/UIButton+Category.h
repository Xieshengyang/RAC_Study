//
//  UIButton+Category.h
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category)
@property(nonatomic, copy, readonly, class)UIButton *(^Creat)(void);
@property(nonatomic, copy, readonly)UIButton *(^SetTitleForState)(NSString *, UIControlState);
@property(nonatomic, copy, readonly)UIButton *(^SetTargetActionForEvent)(id, SEL, UIControlEvents);

@end

NS_ASSUME_NONNULL_END
