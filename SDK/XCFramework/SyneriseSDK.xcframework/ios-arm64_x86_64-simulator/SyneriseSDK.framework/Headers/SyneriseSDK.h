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

// Exceptions
#import <SyneriseSDK/SNRExceptionHandler.h>
#import <SyneriseSDK/SNRException.h>
#import <SyneriseSDK/SNRInvalidArgumentException.h>
#import <SyneriseSDK/SNRInternalInconsistencyException.h>

// Errors
#import <SyneriseSDK/SNRErrorUserInfoKey.h>

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
#import <SyneriseSDK/SNRPromotionStatusString.h>
#import <SyneriseSDK/SNRPromotionTypeString.h>
#import <SyneriseSDK/SNRPromotionSortingKey.h>
#import <SyneriseSDK/SNRClientIdentityProvider.h>

// API Models
#import <SyneriseSDK/SNRBaseModel.h>

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
