//
//  ViewController.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/11.
//

#import "ViewController.h"
#import "UIView+Category.h"

@interface ViewController ()

// block作为属性
/*
 NSInteger(^BlockProperty)(NSInteger value)
     |           |            |        |
 block返回值  block属性名  block参数类型  形参名（可省略）
  无返回值写                            无参数写'void'
   'void'
 */

/// 无参数无返回值的block作为属性
@property(nonatomic, copy)void(^handleBlock)(void);
/// 无参数有返回值的block作为属性
@property(nonatomic, copy)NSInteger(^ReturnBlock)(void);
/// 有参数无返回值的block作为属性
@property(nonatomic, copy)void(^HandleParaBlock)(NSInteger);
/// 有参数有返回值的block作为属性
@property(nonatomic, copy)NSInteger(^BlockProperty)(NSInteger);



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     是将多个操作（多行代码）通过点号(.)链接在一起成为一句代码,使代码可读性好。a(1).b(2).c(3)
     将 返回值为当前类的block 作为返回值，block的参数作为目的参数
     */
    
    /*
     ^{
         NSLog(@"这是一个无参数无返回值block");
     }()
     
     ^:block标志
     {}:block的代码块，在这个大括号内部填写相应的代码
     ():表示执行block，（）里面可以写block的参数，无参数则不用写
     */
    
    
    // 无参数无返回值block
    ^{
        NSLog(@"这是一个无参数无返回值block");
    }();
    
    // 有参数无返回值block
    ^(NSInteger value) {
        NSLog(@"这是一个有参数：value = %zd block", value);
    }(333);
    
    // 有参数有返回值block
    ^NSInteger(NSInteger value) {
        NSInteger result = 2 * value;
        NSLog(@"这是一个有参数：value = %zd，有返回值 result = 2 * value", value);
        return result;
    }(43444);
    
    // 给block赋值
    self.handleBlock = ^{NSLog(@"给block赋值");};
    self.handleBlock();
    
    [self myHandleBlock:^{
        NSLog(@"无参数无返回值block作为方法参数");
    }];
    
    [self myHandleBlock:self.handleBlock];
    self.handleBlock();
    
    [self myHandleBlock2:^(NSInteger value) {
        NSLog(@"有参数无返回值block作为方法参数 value = %zd", value);
    }];
    
    [self myHandleBlock3:^NSInteger(NSInteger value1, NSInteger value2) {
        NSLog(@"有两个参数，有返回值的block作为方法的参数");
        return value1 + value2;
    }];
    
    [self createABlock3](333, self.view);
    
    
    UIView *redView = [[UIView alloc] init].FrameBlock(CGRectMake(30, 90, 100, 300)).ColorBlock(UIColor.redColor);
    redView.FrameBlock(CGRectMake(30, 60, 30, 30)).ColorBlock(UIColor.greenColor);
    [self.view addSubview:redView];

}

// 无参数无返回值的block作为方法参数
- (void)myHandleBlock:(void(^)(void))block {
    block = ^ {
        NSLog(@"修改block的值");
    };
    block();
}

// 有参数无返回值的block作为方法的参数
- (void)myHandleBlock2:(void(^)(NSInteger))block {
    block(999);
}

- (void)myHandleBlock3:(NSInteger(^)(NSInteger, NSInteger))block {
    block(3333,5555);
}

// block作为方法的返回值
- (void(^)(void))creatABlock1 {
    return ^{
        NSLog(@"返回一个无参数无返回值的block");
    };
}

// 有参数，无返回值的block作为方法的返回值
- (void(^)(NSInteger, NSInteger))creatAblock2 {
    return ^(NSInteger value1, NSInteger value2){
        NSLog(@"sum = %zd", value1 + value2);
    };
}

/// 有返回值，有参数的block作为方法的返回值
- (NSInteger(^)(NSInteger, UIView *))createABlock3 {
    return ^NSInteger(NSInteger value1, UIView *view) {
        if (view.backgroundColor == UIColor.clearColor) {
            NSLog(@"view的背景色透明，返回 value");
            return value1;
        } else {
            NSLog(@"view的背景色非透明，返回 value * 2");
            return value1 * 2;
        }
    };
}

@end
