//
//  ViewController.m
//  VisibleBuildConfig
//
//  Created by David Li on 11/09/2017.
//
//

#import "ViewController.h"
#import "VisibleBuildConfig.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.textColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBuildConfigChanged:) name:kVisibleBuildConfigChanged object:nil];
    [self onBuildConfigChanged:nil];
}

- (IBAction)showBuildConfigBrowser:(id)sender {
    [[VisibleBuildConfig sharedInstance] showConfigBrowser];
}

- (void)onBuildConfigChanged:(NSNotification *)ntf
{
    NSString *configStr = [NSString stringWithFormat:@"ConfigName: %@\nHost: %@\nAllowMock: %d\nMockInt: %d\nMockFloat: %.2f", [VisibleBuildConfig sharedInstance].configName, [VisibleBuildConfig sharedInstance].host, [VisibleBuildConfig sharedInstance].allowMock, [VisibleBuildConfig sharedInstance].mockInt, [VisibleBuildConfig sharedInstance].mockFloat];
    NSArray *mockArray = [[VisibleBuildConfig sharedInstance] configValueForKey:@"MockArray"];
    if (mockArray) {
        configStr = [configStr stringByAppendingFormat:@"\nMockArray: %@", mockArray];
    }
    NSDictionary *mockDict = [[VisibleBuildConfig sharedInstance] configValueForKey:@"MockDict"];
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
