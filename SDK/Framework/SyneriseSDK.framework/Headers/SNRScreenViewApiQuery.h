//
//  SNRScreenViewApiQuery.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRScreenViewApiQuery
 */

NS_SWIFT_NAME(ScreenViewApiQuery)
@interface SNRScreenViewApiQuery : NSObject

@property (copy, nonatomic, nullable, readwrite) NSString *feedSlug;
@property (copy, nonatomic, nullable, readwrite) NSString *productID;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithFeedSlug:(NSString *)feedSlug productID:(NSString *)productID;

@end

NS_ASSUME_NONNULL_END
