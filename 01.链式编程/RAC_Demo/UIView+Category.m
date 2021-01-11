//
//  UIView+Category.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/11.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (UIView * _Nonnull (^)(CGRect))FrameBlock {
    return ^UIView *(CGRect rect){
        self.frame = rect;
        return self;
    };
}

- (UIView *(^)(UIColor *))ColorBlock {
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
- (UIView * _Nonnull (^)(void (^ _Nonnull)(void)))TapBLock {
    
    return ^UIView *(void(^block)(void)) {
        block();
        return self;
    };
}


@end
