//
//  SyneriseSDK.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

#import <SyneriseSDK/SNRSynerise.h>

// Modules
#import <SyneriseSDK/SNRTracker.h>
#import <SyneriseSDK/SNRClient.h>
#import <SyneriseSDK/SNRInjector.h>

// Exceptions
#import <SyneriseSDK/SNRExceptionHandler.h>
#import <SyneriseSDK/SNRException.h>
#import <SyneriseSDK/SNRInvalidArgumentException.h>
#import <SyneriseSDK/SNRInternalInconsistencyException.h>

// Errors
#import <SyneriseSDK/SNRErrorCode.h>
#import <SyneriseSDK/SNRErrorUserInfoKey.h>
#import <SyneriseSDK/SNRError.h>
#import <SyneriseSDK/SNRApiError.h>
#import <SyneriseSDK/SNRApiErrorBody.h>
#import <SyneriseSDK/SNRApiErrorCause.h>
#import <SyneriseSDK/SNRInvalidArgumentError.h>
#import <SyneriseSDK/SNRInternalInconsistencyError.h>

// Other Types
#import <SyneriseSDK/SNRSyneriseApiUrl.h>
#import <SyneriseSDK/SNRSyneriseSource.h>
#import <SyneriseSDK/SNRSyneriseActivity.h>
#import <SyneriseSDK/SNRHostApplicationType.h>
#import <SyneriseSDK/SNRLocalizableStringKey.h>
#import <SyneriseSDK/SNRPushNotificationsRegistrationOrigin.h>
#import <SyneriseSDK/SNRClientSignOutMode.h>
#import <SyneriseSDK/SNRClientSessionEndReason.h>

// API Queries and Arguments
#import <SyneriseSDK/SNRApiQuerySortingOrder.h>
#import <SyneriseSDK/SNRClientEventsApiQuery.h>
#import <SyneriseSDK/SNRPromotionStatusString.h>
#import <SyneriseSDK/SNRPromotionTypeString.h>
#import <SyneriseSDK/SNRPromotionSortingKey.h>
#import <SyneriseSDK/SNRClientIdentityProvider.h>

// API Models
#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRClientAgreements.h>
#import <SyneriseSDK/SNRClientSex.h>
#import <SyneriseSDK/SNRClientRegisterAccountContext.h>
#import <SyneriseSDK/SNRClientAuthenticationContext.h>
#import <SyneriseSDK/SNRClientConditionalAuthenticationContext.h>
#import <SyneriseSDK/SNRClientSimpleAuthenticationData.h>
#import <SyneriseSDK/SNRClientConditionalAuthStatus.h>
#import <SyneriseSDK/SNRClientConditionalAuthResult.h>
#import <SyneriseSDK/SNRClientPasswordResetRequestContext.h>
#import <SyneriseSDK/SNRClientPasswordResetConfirmationContext.h>
#import <SyneriseSDK/SNRClientAccountInformation.h>
#import <SyneriseSDK/SNRClientUpdateAccountBasicInformationContext.h>
#import <SyneriseSDK/SNRClientUpdateAccountContext.h>
#import <SyneriseSDK/SNRClientEventData.h>
#import <SyneriseSDK/SNRTokenOrigin.h>
#import <SyneriseSDK/SNRToken.h>
#import <SyneriseSDK/SNRTokenPayload.h>
#import <SyneriseSDK/SNRInAppMessageData.h>

// Content Widget
#import <SyneriseSDK/SNRContentWidgetAppearance.h>
#import <SyneriseSDK/SNRContentWidgetLayout.h>
#import <SyneriseSDK/SNRContentWidgetHorizontalSliderLayout.h>
#import <SyneriseSDK/SNRContentWidgetGridLayout.h>
#import <SyneriseSDK/SNRContentWidgetItemLayout.h>
#import <SyneriseSDK/SNRContentWidgetBasicProductItemLayout.h>
#import <SyneriseSDK/SNRContentWidgetBadgeItemLayoutPartial.h>
#import <SyneriseSDK/SNRContentWidgetImageButtonCustomAction.h>
#import <SyneriseSDK/SNRContentWidgetOptions.h>
#import <SyneriseSDK/SNRContentWidgetRecommendationsOptions.h>
#import <SyneriseSDK/SNRContentWidgetRecommendationDataModel.h>
#import <SyneriseSDK/SNRContentWidgetBadgeDataModel.h>
#import <SyneriseSDK/SNRContentWidget.h>

// Notification Service/Content Extensions & Helpers
#import <SyneriseSDK/SNRNotificationServiceExtension.h>
#import <SyneriseSDK/SNRSingleMediaContentExtensionViewController.h>
#import <SyneriseSDK/SNRCarouselContentExtensionViewController.h>
