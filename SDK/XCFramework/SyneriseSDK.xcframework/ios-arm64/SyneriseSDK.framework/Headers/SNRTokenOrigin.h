//
//  SNRTokenOrigin.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRTokenOrigin
 */

typedef NS_ENUM(NSUInteger, SNRTokenOrigin) {
    SNRTokenOriginUnknown,
    SNRTokenOriginIncognito,
    SNRTokenOriginAnonymous,
    SNRTokenOriginSynerise,
    SNRTokenOriginSimpleAuth,
    SNRTokenOriginOAuth,
    SNRTokenOriginFacebook,
    SNRTokenOriginApple,
    SNRTokenOriginGoogle
} NS_SWIFT_NAME(TokenOrigin);

NSString * SNR_TokenOriginToString(SNRTokenOrigin type);
SNRTokenOrigin SNR_StringToTokenOrigin(NSString * _Nullable string);

NS_ASSUME_NONNULL_END

