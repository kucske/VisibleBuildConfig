//
//  LPViewController.m
//  VisibleBuildConfig
//
//  Created by 492334421@qq.com on 09/18/2017.
//  Copyright (c) 2017 492334421@qq.com. All rights reserved.
//

#import "LPViewController.h"
#import "MyVisibleBuildConfig.h"

@interface LPViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation LPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.textColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBuildConfigChanged:) name:kVisibleBuildConfigChanged object:nil];
    [self onBuildConfigChanged:nil];
}

- (IBAction)showBuildConfigBrowser:(id)sender {
    [[MyVisibleBuildConfig sharedInstance] showConfigBrowser];
}

- (void)onBuildConfigChanged:(NSNotification *)ntf
{
    NSString *configStr = [NSString stringWithFormat:@"ConfigName: %@\nHost: %@\nAllowMock: %d\nMockInt: %d\nMockFloat: %.2f", [MyVisibleBuildConfig sharedInstance].configName, [MyVisibleBuildConfig sharedInstance].host, [MyVisibleBuildConfig sharedInstance].allowMock, [MyVisibleBuildConfig sharedInstance].mockInt, [MyVisibleBuildConfig sharedInstance].mockFloat];
    NSArray *mockArray = [[MyVisibleBuildConfig sharedInstance] configValueForKey:@"MockArray"];
    if (mockArray) {
        configStr = [configStr stringByAppendingFormat:@"\nMockArray: %@", mockArray];
    }
    NSDictionary *mockDict = [[MyVisibleBuildConfig sharedInstance] configValueForKey:@"MockDict"];
    if (mockDict) {
        configStr = [configStr stringByAppendingFormat:@"\nMockDict: %@", mockDict];
    }
    
    if (_textView.text.length > 0) {
        _textView.text = [NSString stringWithFormat:@"%@\n\n%@", _textView.text, configStr];
    }else{
        _textView.text = configStr;
    }
}


@end
