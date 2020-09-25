//
//  SGApplicationManager.h
//  codeSprite
//
//  Created by annidy on 2020/9/25.
//  Copyright © 2020 soulghost. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SGApplicationManager : NSObject

+ (instancetype)shared;

- (NSString *)nameForBundle:(NSURL *)url;
- (NSString *)nameForData:(NSURL *)url;


@end

NS_ASSUME_NONNULL_END
