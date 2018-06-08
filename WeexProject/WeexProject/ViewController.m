//
//  ViewController.m
//  WeexProject
//
//  Created by 鑫龙魂 on 2018/6/8.
//  Copyright © 2018年 鑫龙魂. All rights reserved.
//

#import "ViewController.h"
#import <WeexSDK/WXSDKInstance.h>
#import <WeexSDK/WeexSDK.h>

@interface ViewController ()
@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) NSURL *url;
//@property (nonatomic, retain) WXRootView *weexView;
@end

@implementation ViewController
- (void)dealloc
{
    [_instance destroyInstance];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame = self.view.frame;
    
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
//        [weakSelf.weexView removeFromSuperview];
//        weakSelf.weexView = view;
//        [weakSelf.view addSubview:weakSelf.weexView];
    };
    
    _instance.onFailed = ^(NSError *error) {
        //process failure
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        //process renderFinish
    };
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"js"];
    self.url = [NSURL URLWithString:@"https://www.baidu.com"];
    [_instance renderWithURL:self.url options:@{@"bundleUrl":[self.url absoluteString]} data:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
