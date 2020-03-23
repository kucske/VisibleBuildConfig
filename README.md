# VisibleBuildConfig

[![CI Status](http://img.shields.io/travis/492334421@qq.com/VisibleBuildConfig.svg?style=flat)](https://travis-ci.org/492334421@qq.com/VisibleBuildConfig)
[![Version](https://img.shields.io/cocoapods/v/VisibleBuildConfig.svg?style=flat)](http://cocoapods.org/pods/VisibleBuildConfig)
[![License](https://img.shields.io/cocoapods/l/VisibleBuildConfig.svg?style=flat)](http://cocoapods.org/pods/VisibleBuildConfig)
[![Platform](https://img.shields.io/cocoapods/p/VisibleBuildConfig.svg?style=flat)](http://cocoapods.org/pods/VisibleBuildConfig)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

VisibleBuildConfig is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'VisibleBuildConfig'
```

## What is it?
It a simple class that enables you to define build configurations through plist. And you can switch configuration easily in a window.

## How to use
### Inherit `VisibleBuildConfig`
For example, name your class as `MyVisibleBuildConfig`. And after your key window is created, add below code:

```objective-c
    [[MyVisibleBuildConfig sharedInstance] setupWithPlist:@"MyVisibleBuildConfig"];
#ifdef DEBUG
    [[MyVisibleBuildConfig sharedInstance] enableSwipe];
#else
    [[MyVisibleBuildConfig sharedInstance] setAsRelease];
#endif
```
* For DEBUG build, enable swiping left from right edge to show the build configration browser. You can switch configuration in here.
* For RELEASE build, set it as release to fix the build configuration included `Release` key valued `YES`, otherwise use the the first one. 

### Create your build configuration plist
For example, name your plist as `MyVisibleBuildConfig.plist`. In the plist, you can define multiple build configutions. `ConfigName` is the only required key. `Release` is optional that flag it as the configuration for release build. Others are defined by yourself. Any types of data supported by plist are supported here.
```xml
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">

<plist version="1.0"> 
  <array> 
    <dict> 
      <key>ConfigName</key>  
      <string>QA</string>  
      <key>Host</key>  
      <string>qa.example.com</string>  
      <key>AllowMock</key>  
      <true/>  
      <key>MockInt</key>  
      <integer>100</integer>  
      <key>MockFloat</key>  
      <string>22.88</string>  
      <key>MockArray</key>  
      <array> 
        <string>David</string>  
        <string>Alice</string>  
        <string>Brown</string>  
        <string>Jim</string> 
      </array> 
    </dict>  
    ...
  </array> 
</plist>
```
### Add properties in `MyVisibleBuildConfig.h`
Add properties corresponding to your plist. It's case insensitive. So you can define the key with name `Release`, but property with name `release`. Then you can access values thourgh properties. If you dont want to add properties, you can use configValueForKey to access all values.
```objective-c
@property(nonatomic, strong) NSString   *configName;
@property(nonatomic, strong) NSString   *host;
@property(nonatomic, assign) BOOL       allowMock;
@property(nonatomic, assign) int        mockInt;
@property(nonatomic, assign) float      mockFloat;
```

### Observe switch notification
Every switch action will cause `kVisibleBuildConfigChanged` notification posted. You can reset your context with receiving the notification.

## Author

davidli86, 492334421@qq.com

## License

VisibleBuildConfig is available under the MIT license. See the LICENSE file for more info.


![screenshot](https://github.com/davidli86/VisibleBuildConfig/raw/master/Example/screenshot/screenshot.PNG)

