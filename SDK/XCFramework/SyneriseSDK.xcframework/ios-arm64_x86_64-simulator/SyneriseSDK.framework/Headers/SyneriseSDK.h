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

// Constants
#import <SyneriseSDK/SNRSyneriseConstants.h>
#import <SyneriseSDK/SNRSyneriseApiUrl.h>
#import <SyneriseSDK/SNRLocalizableStringKey.h>
#import <SyneriseSDK/SNRErrorUserInfoKey.h>
#import <SyneriseSDK/SNRNotificationServiceExtensionOptionsKey.h>

// Other Types
#import <SyneriseSDK/SNRApiQuerySortingOrder.h>
#import <SyneriseSDK/SNRPromotionStatusString.h>
#import <SyneriseSDK/SNRPromotionTypeString.h>
#import <SyneriseSDK/SNRPromotionSortingKey.h>

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
