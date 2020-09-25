//
//  SGApplicationManager.m
//  codeSprite
//
//  Created by annidy on 2020/9/25.
//  Copyright © 2020 soulghost. All rights reserved.
//

#import "SGApplicationManager.h"

@interface LSApplicationProxy : NSObject
@property (nonatomic, readonly) NSURL *bundleContainerURL;
@property (nonatomic, readonly) NSURL *containerURL;
@property (nonatomic, readonly) NSURL *dataContainerURL;
@property (nonatomic, readonly) NSString *itemName;

@end

@interface SGApplicationManager ()
@property  NSArray<LSApplicationProxy *> *allApplications;

@end

@implementation SGApplicationManager

+ (instancetype)shared {
    static SGApplicationManager *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[SGApplicationManager alloc] init];
    });
    return shared;
}

- (instancetype)init {
    self = [super init];
    
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");

    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    self.allApplications = [workspace performSelector:@selector(allApplications)];
    
    return self;
}

- (NSString *)nameForBundle:(NSURL *)url
{
    for (LSApplicationProxy *proxy in self.allApplications) {
        if ([proxy.bundleContainerURL isEqual:url]) {
            return proxy.itemName;
        }
    }
    return nil;
}

- (NSString *)nameForData:(NSURL *)url
{
    for (LSApplicationProxy *proxy in self.allApplications) {
        if ([proxy.dataContainerURL isEqual:url]) {
            return proxy.itemName;
        }
    }
    return nil;
}


@end
