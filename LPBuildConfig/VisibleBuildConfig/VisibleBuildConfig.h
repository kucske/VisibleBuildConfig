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

//Config name is reqired and unique
@property(nonatomic, strong) NSString   *configName;


/////////////////////////////////////////////////////////////////////////////////////////
//Define properties corresponding to your plist. Any type supported by plist is supported.

@property(nonatomic, strong) NSString   *host;
@property(nonatomic, assign) BOOL       allowMock;
@property(nonatomic, assign) int        mockInt;
@property(nonatomic, assign) float      mockFloat;

/////////////////////////////////////////////////////////////////////////////////////////


+ (instancetype)sharedInstance;

//Fix to use the build config with Release parameter valued YES. If no Release, use the first.
- (void)setAsRelease;

//Enable left swipe to show build config browser
- (void)enableSwipe;

//Show build config browser
- (void)showConfigBrowser;

//Get value with key from the current build config data
- (id)configValueForKey:(NSString *)key;

@end
