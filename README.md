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
* For DEBUG build, enable swiping left from right edge to show the build configration browser. You can switch configuration in here.
* For RELEASE build, set it as release to fix the build configuration included Release key valued YES, otherwise use the the first one. 

## Define your build configurations
#### Config `VisibleBuildConfig.plist`
In `VisibleBuildConfig.plist`, you can define multiple build configutions. `ConfigName` is the only required key. `Release` is optional that flag it as the configuration for release build. Others are defined by yourself. Any types of data supported by plist are supported here.
```xml
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
</array>
</dict>
<dict>
<key>ConfigName</key>
<string>Stage</string>
<key>Host</key>
<string>stage.example.com</string>
<key>AllowMock</key>
<true/>
</array>
</plist>

```objective-c
#### Add properties in `VisibleBuildConfig.h`
Add properties corresponding to your plist. It`s case insensitive. So you can define the key with name `Release`, but property with name `release`. Then you can access values thourgh properties. If you dont want to add properties, you can use configValueForKey to access all values.
```
@property(nonatomic, strong) NSString   *configName;
@property(nonatomic, strong) NSString   *host;
@property(nonatomic, assign) BOOL       allowMock;
@property(nonatomic, assign) int        mockInt;
@property(nonatomic, assign) float      mockFloat;
```

#### Switch notification
Every switch action will cause kVisibleBuildConfigChanged notification posted. You can reset your context with the notification.


![screenshot](https://github.com/davidli86/VisibleBuildConfig/raw/master/screenshot/screenshot.PNG)

