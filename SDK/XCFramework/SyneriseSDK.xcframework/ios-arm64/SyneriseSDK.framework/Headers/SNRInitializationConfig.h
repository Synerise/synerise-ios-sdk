//
//  SNRInitializationConfig.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(InitializationConfig)
@interface SNRInitializationConfig : NSObject

@property (copy, nonatomic, nullable, readwrite) NSString *requestValidationSalt;

@end

NS_ASSUME_NONNULL_END
