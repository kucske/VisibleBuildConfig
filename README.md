## What is it?
It a simple class that enables you to define build configurations through plist. And you can switch configuration easily in a window.

## How to use
After your key window is created, add below code:

```objective-c
#ifdef DEBUG
    [[VisibleBuildConfig sharedInstance] enableSwipe];
#else
    [[VisibleBuildConfig sharedInstance] setAsRelease];
#endif
```
* For DEBUG build, enable swiping left from right edge to show the build configration browser. You switch configuration in here.
* For RELEASE build, set it as release to fix the build configuration included Release key valued YES, otherwise use the the first one. 

## Define your build configurations
#### Config 'VisibleBuildConfig.plist'
In 'VisibleBuildConfig.plist', you can define multiple build configutions. 'ConfigName' is the only required key. 'Release' is optional that flag it as the configuration for release build. Others are defined by yourself. Any types of data supported by plist are supported here.
#### Add properties in 'VisibleBuildConfig.h'
Add properties corresponding to your plist. It's case insensitive. So you can define the key with name 'Release', but property with name 'release'. Then you can access values thourgh properties. If you don't want to add properties, you can use 'configValueForKey' to access all values.
