//
//  UIButton+Category.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/12.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)
+ (UIButton *(^)(void))Creat {
    return ^UIButton *(){
        return [UIButton buttonWithType:UIButtonTypeCustom];
    };
}

- (UIButton * _Nonnull (^)(NSString * _Nonnull, UIControlState))SetTitleForState {
    return ^UIButton *(NSString *title, UIControlState state){
        [self setTitle:title forState:state];
        return self;
    };
}
- (UIButton * _Nonnull (^)(id _Nonnull, SEL _Nonnull, UIControlEvents))SetTargetActionForEvent {
    return ^UIButton *(id target, SEL action, UIControlEvents event){
        [self addTarget:target action:action forControlEvents:event];
        return self;
    };
}
@end
