//
//  ViewController.m
//  RAC_Demo
//
//  Created by shengyang xie on 2021/1/11.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)RACReplaySubjectTest {
    // RACReplaySubject使用步骤:
    // 1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
    // 2.可以先订阅信号，也可以先发送信号。
    // 2.1 订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
    // 2.2 发送信号 sendNext:(id)value

    // RACReplaySubject:底层实现和RACSubject不一样。
    // 1.调用sendNext发送信号，把值保存起来，然后遍历刚刚保存的所有订阅者，一个一个调用订阅者的nextBlock。
    // 2.调用subscribeNext订阅信号，遍历保存的所有值，一个一个调用订阅者的nextBlock

    // 如果想当一个信号被订阅，就重复播放之前所有值，需要先发送信号，在订阅信号。
    // 也就是先保存值，在订阅值。
    RACReplaySubject *subject = [RACReplaySubject subject];
    
    [subject sendNext:@"66666666"];
    [subject sendNext:@"77777777"];
    
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第一个订阅者接收到next信号：%@", x);
    }];
    
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第二个订阅者接收到next信号：%@", x);
    }];
    
}
- (void)RACSubjectTest {
    // RACSubject使用步骤
    // 1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
    // 2.订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
    // 3.发送信号 sendNext:(id)value
    
    // 1.创建subject
    RACSubject *subject = [RACSubject subject];
    // 2.订阅信号
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第一个订阅者接收到next信号：%@", x);
    }];
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第二个订阅者接收到next信号：%@", x);
    }];
    
    [subject subscribeCompleted:^{
        NSLog(@"接收到completed信号");
    }];
    [subject subscribeError:^(NSError * _Nullable error) {
        NSLog(@"接收到error信号");
    }];

    // 3.发送信号
    [subject sendNext:@"next"];
    [subject sendNext:@"next3333"];
    [subject sendCompleted];
    [subject sendError:[NSError errorWithDomain:NSCocoaErrorDomain code:404 userInfo:nil]];
    /*
     sendCompleted/sendError:之后，再发送信号，不会有响应
     */

}
    
- (void)RACSignalTest {
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        // block的调用时刻：每当有订阅者订阅信号，就会调用block
        
        // 2.发送next信号
        [subscriber sendNext:@"333"];
        [subscriber sendNext:@"444"];
        /*
         completed/error 信号，都会终止信号订阅
         在 sendCompleted/sendError之后在发送信号，不会有响应
         */
        
        // 2.1 发送completed信号
        [subscriber sendCompleted];
        // 2.2 发送error信号
        [subscriber sendError:[NSError errorWithDomain:NSCocoaErrorDomain code:404 userInfo:nil]];
        
        // 这次信号的发送，不会有响应
        [subscriber sendNext:@"555"];
        
        return [RACDisposable disposableWithBlock:^{
            // block调用时刻：当信号发送完成或者发送错误，就会自动执行这个block,取消订阅信号。
            // 执行完Block后，当前信号就不在被订阅了。
            NSLog(@"信号被销毁");
        }];
    }];
    
    // 3.订阅信号，才能激活信号
    [signal subscribeNext:^(id  _Nullable x) {
        // block调用时刻：每当有next信号发出数据，就会调用block
        NSLog(@"接收到next信号：%@", x);
    } completed:^{
        // block调用时刻：每当有completed信号发出数据，就会调用block
        NSLog(@"接收到completed信号，订阅结束");
    }];
    
    [signal subscribeNext:^(id  _Nullable x) {
        // block调用时刻：每当有next信号发出数据，就会调用block
        NSLog(@"接收到next信号：%@", x);
    } error:^(NSError * _Nullable error) {
        // block调用时刻：每当有error信号发出数据，就会调用block
        NSLog(@"接收到error信号：%@", error);
    }];
    
    /*
     也可以分开订阅信号
     [signal subscribeNext:^(id  _Nullable x) {
         NSLog(@"接收到next信号：%@", x);
     }];
     [signal subscribeCompleted:^{
         NSLog(@"接收到completed信号，订阅结束");
     }];
     [signal subscribeError:^(NSError * _Nullable error) {
         NSLog(@"接收到error信号：%@", error);
     }];
     */

}


@end
