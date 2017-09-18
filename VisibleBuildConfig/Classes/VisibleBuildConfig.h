//
//  VisibleBuildConfig.h
//  VisibleBuildConfig
//
//  Created by David Li on 11/09/2017.
//
//

#import <Foundation/Foundation.h>

#define kVisibleBuildConfigChanged  @"kVisibleBuildConfigChanged"

@interface VisibleBuildConfig : NSObject

//ConfigName is reqired and unique
@property(nonatomic, strong) NSString   *configName;

+ (instancetype)sharedInstance;

//setup configuration data with plist
- (void)setupWithPlist:(NSString *)plistFile;

//Fix to use the build config with Release parameter valued YES. If no Release, use the first.
- (void)setAsRelease;

//Enable left swipe to show build config browser
- (void)enableSwipe;

//Show build config browser
- (void)showConfigBrowser;

//Get value with key from the current build config data
- (id)configValueForKey:(NSString *)key;

@end
