//
//  UIView+Category.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import "UIView+Category.h"

@implementation UIView (Category)

+ (UIView * _Nonnull (^)(void))Creat {
    return ^UIView *(){
        return [[self alloc] init];
    };
}

- (UIView * _Nonnull (^)(CGRect))SetFrame {
    return ^UIView *(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIView * _Nonnull (^)(UIColor * _Nonnull))SetBackGroundColor {
    return ^UIView *(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (UIView * _Nonnull (^)(UIView * _Nonnull))AddSubView {
    return ^UIView *(UIView *subView){
        [self addSubview:subView];
        return self;
    };
}


@end
