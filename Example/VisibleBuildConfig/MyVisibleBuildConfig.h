//
//  MyVisibleBuildConfig.h
//  VisibleBuildConfig
//
//  Created by David Li on 18/09/2017.
//
//

#import "VisibleBuildConfig.h"

@interface MyVisibleBuildConfig : VisibleBuildConfig

/////////////////////////////////////////////////////////////////////////////////////////
//Define properties corresponding to your plist. Any type supported by plist is supported.

@property(nonatomic, strong) NSString   *host;
@property(nonatomic, assign) BOOL       allowMock;
@property(nonatomic, assign) int        mockInt;
@property(nonatomic, assign) float      mockFloat;

/////////////////////////////////////////////////////////////////////////////////////////

@end
