
# Changelog
All notable changes to this project will be documented in this file.

Note that Objective-C class names are prefixed by `SNR`. In the changelog below, these are names used in Swift, without the prefix.

## [5.8.0] - 2025-10-28

### Fixed
- Potential issues with registering and updating accounts (also with Simple Authentication) when the `sex` property was set to `.notSpecified`. This caused a `Bad Request` error. The problem occurred since version 5.5.0.
- Issue with the `sex` property in the `ClientUpdateAccountContext` model. It could not be updated. The problem occurred since version 5.5.0.
- Issue with the `agreements` property while registering, authenticating, and updating accounts (also with Simple Authentication). The property could not be updated. The problem occurred since version 5.5.0.

### Added
- The `Content.generateBrickworks(apiQuery:success:failure:)` method. The new method generates a Brickworks record for the parameters provided in the query object.

### Changed
- Improvements to stability.


## [5.7.0] - 2025-10-07 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH MANAGING ACCOUNT. USE VERSION 5.8.0 !!!

### Added
- The `Injector.closeInAppMessage(campaignHash:)` method to programmaticaly close a currently opened inapp from the application.


## [5.6.3] - 2025-10-03 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH MANAGING ACCOUNT. USE VERSION 5.8.0 !!!

### Fixed
- `NotificationInfo` properties visibility to public.


## [5.6.2] - 2025-09-26 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH MANAGING ACCOUNT. USE VERSION 5.8.0 !!!

### Fixed
- The `SRInApp.trackCustomEvent` method in the JS interface in the in-app messaging module. The method didn't work correctly since version 5.0.0.


## [5.6.1] - 2025-09-24 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH MANAGING ACCOUNT. USE VERSION 5.8.0 !!!

### Fixed
- The issue with fetching the server time. The problem occurred since version 5.0.0.
- Some potential issues with possible blocking of sending events from the tracker module. The problem occurred since version 5.0.0.

### Changed
- Improvements to stability.


## [5.6.0] - 2025-09-24 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH TRACKING API. USE VERSION 5.6.1 !!!

### Added
- `SRInApp.resize` method to the JS interface in the in-app messaging module, allowing you resize an in-app message. You can read more in the documentation.
- `SRInApp.getDeviceData` method to the JS interface in the in-app messaging module. This method allows fetching device info (operating system, if dark mode is enabled, etc.). You can read more in the documentation.

### Changed
- We implemented a new format of input in the `SRInApp.internalMethod` method in the JS interface in the in-app messaging module. Old parameters still work, but we changed the format for consistency.


## [5.5.0] - 2025-09-08 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH TRACKING API. USE VERSION 5.6.1 !!!

### Added
- `SRInApp.internalMethod` method to JS interface in the in-app messaging module. This method allows to invoke the native SDK method from predefined methods. You can read more in the documentation about available methods and params you may use. 


## [5.4.5] - 2025-08-14

### Fixed
- Default setting for `Synerise.settings.inAppMessaging.shouldSendInAppCappingEvent` is changed to `true`. It was `false` due to a bug since version 4.20.0.


## [5.4.4] - 2025-07-07

### Fixed
- The issue with vouchers api methods.


## [5.4.3] - 2025-06-22 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH VOUCHERS API. USE VERSION 5.4.4 !!!

### Fixed
- Potential issues with URL and deeplink actions when the delegate is set after SDK initialization.
- Initializers in `PromotionIdentifier` now have proper Objective-C naming - fixed broken compatibility.
- The `discountValue` property in `PromotionDiscountStep` now uses the correct Objective-C type (`NSNumber`) - fixed broken compatibility.


## [5.4.2] - 2025-06-17 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH VOUCHERS API. USE VERSION 5.4.4 !!!

### Fixed
- Some potential issues with notification processing in `NotificationServiceExtension`.


## [5.4.1] - 2025-06-13 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH VOUCHERS API. USE VERSION 5.4.4 !!!

### Fixed
- Some potential issues with notification processing in `NotificationServiceExtension`.


## [5.4.0] - 2025-06-09 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH VOUCHERS API. USE VERSION 5.4.4 !!!

### Fixed
- InAppMessage deeplink action.

### Changed
- Properties in `Promotion` model: `details`, `currentRedeemedQuantity`, `currentRedeemLimit`, `activationCounter`, `possibleRedeems`, `requireRedeemedPoints` and `discountValue` are nullable now.

### Added
- `Synerise.settings.sdk.doNotTrack` option to fully disable tracking customer's activity in SDK. When enabled, the SDK stops sending tracking events and replaces the UUID with a random one, preventing profile creation and blocking some functionalities (e.g. authentication).

### Removed
- `SNR_PromotionStatusToString(_:)` and `SNR_StringToPromotionStatus(_:)` method.
- `SNR_PromotionTypeToString(_:)` and `SNR_StringToPromotionType(_:)` method.
- `SNR_PromotionDiscountTypeToString(_:)` and `SNR_StringToPromotionDiscountType(_:)` method.
- `SNR_PromotionDiscountModeToString(_:)` and `SNR_StringToPromotionDiscountMode(_:)` method.


## [5.3.0] - 2025-04-17
 
### Added
- `params` property in `DocumentApiQuery` model to set custom params for fetching Documents.
- `params` property in `ScreenViewApiQuery` model to set custom params for fetching Screen Views.
- `SyneriseApiUrls.SYNERISE_AZ_API_URL`, `SyneriseApiUrls.SYNERISE_AZU_API_URL`, `SyneriseApiUrls.SYNERISE_GEB_API_URL` constants to easily get the URL of the API (Swift).
- `SYNERISE_AZ_API_URL`, `SYNERISE_AZU_API_URL`, `SYNERISE_GEB_API_URL` constants to easily get the URL of the API (Objective-C).
 
### Changed
- Improvements to stability.


## [5.2.0] - 2025-04-09

### Fixed
- Action handling for deeplink when delegate implemented the old method for handling deeplink. When the old method was implemented with the new method, the old method was invoked instead the new one.

### Changed
- Improvements to stability.


## [5.1.0] - 2025-03-27

### Added
- In-app campaigns can now use the safe area of the screen, allowing you to display full-screen in-app messages. This option is called "Safe area" in the "Display type" option group in the campaign creator. If switched on, it allows the in-app message to extend into system UI. If switched off, it avoids system bars, notches, and other UI elements.


## [5.0.6] - 2025-03-12

### Fixed
- Issue with authentication (all types): when a customer wanted to authenticate another account, the UUID was not regenerated. The problem occurred since version 4.23.4.

### Changed
- Improvements to stability.


## [5.0.5] - 2025-03-06

### Changed
- Optimization of the In-app messaging module.
- Improvements to stability.


## [5.0.4] - 2025-03-03

### Changed
- Improvements to the SDK hybrid plugins (Flutter and React Native).
- Improvements to stability.


## [5.0.3] - 2025-03-03

### Fixed
- Issue that could have caused crash in rare cases when the appGroupIdentifier didn't match the application's configuration.


## [5.0.2] - 2025-02-23

### Fixed
- Issue that could have caused crash in specific cases in the SDK initialization.


## [5.0.1] - 2025-02-10

### Changed
- These initializers of `Event` are not available now: `init(label:)` and `init(label:params:)`. Please use concrete `Event` subclasses, use `CustomEvent` or other initializers in your `Event` subclasses.
- Improvements to stability.


## [5.0.0] - 2025-01-03

IMPORTANT:
- This major version is NOT backwards compatible.
- Support for older iOS versions ends. Minimum deployment target is changed to iOS 13.
- Bitcode is not supported in SDK version 5.0.0 and higher. Xcode ignores bitcode.

### Added
- `SyneriseSource` enum replacing `SyneriseActivity` in `SyneriseDelegate` methods. `SyneriseActivity` is deprecated.
- `appVersion` parameter for `client.applicationStarted` event. It is the same as `version`. `version` is deprecated.
- `sdkPreviousVersion` parameter for `client.applicationStarted` event. It is the version of the SDK before the current version in the application.

### Removed
- `TrackerAutoTrackMode.eager` mode from Auto-Tracking.
- `Client.authenticateByOAuth(accessToken:authID:context:success:failure:)` method. You should use the`Client.authenticate(token:clientIdentityProvider:authID:context:success:failure:)` method.
- `Client.authenticateByOAuthIfRegistered(accessToken:authID:context:success:failure:)` method. You should use the `Client.authenticateConditionally(token:clientIdentityProvider:authID:context:success:failure:)` method.
- `Client.authenticateByFacebook(facebookToken:authID:context:success:failure:)` method. You should use the `Client.authenticate(token:clientIdentityProvider:authID:context:success:failure:)` method.
- `Client.authenticateByFacebookIfRegistered(facebookToken:authID:context:success:failure:)` method. You should use the `Client.authenticateConditionally(token:clientIdentityProvider:authID:context:success:failure:)` method.
- `Client.authenticateByAppleSignIn(identityToken:authID:context:success:failure:)` method. You should use the `Client.authenticate(token:clientIdentityProvider:authID:context:success:failure:)` method.
- `Client.authenticateByAppleSignInIfRegistered(identityToken:authID:context:success:failure:)` method. You should use the `Client.authenticateConditionally(token:clientIdentityProvider:authID:context:success:failure:)` method.
- `Client.signOut(mode:)` method. You should use `Client.signOut(mode:fromAllDevices:success:failure:)`.
- `Client.requestEmailChange(email:password:success:failure:)` method. You should use the`Client.requestEmailChange(email:password:externalToken:customID:success:failure:)` method.
- `Client.requestEmailChangeByFacebook(email:success:failure:)` method. You should use the `Client.requestEmailChange(email:password:externalToken:customID:success:failure:)` method.
- `Client.deleteAccountByOAuth(accessToken:success:failure:)` method. You should use the `Client.deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:)` method.
- `Client.deleteAccountByFacebook(facebookToken:success:failure:)` method. You should use the `Client.deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:)` method.
- `Client.deleteAccountByAppleSignIn(identityToken:success:failure:)` method. You should use the `Client.deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:)` method.
- `InjectorWalkthroughDelegate` for handling actions from Walkthrough campaigns.
- `InjectorBannerDelegate` for handling actions from Banner campaigns.
- `snr_notificationDidDissmis(notificationInfo:)` deprecated method from `NotificationDelegate`.
- `Content.getDocument(slug:success:failure:)` method. You should use `Content.generateDocument(slug:success:failure:)` method.
- `Content.getDocuments(apiQuery:success:failure:)` method.
- `Content.getRecommendations(options:success:failure:)` method.
- `Content.getScreenView(success:failure:)` method. You should use the `Content.generateScreenView(feedSlug:success:failure:)` method.
- `Synerise.isSyneriseBanner(userInfo:)`
- `Injector.getWalkthrough()` method.
- `Injector.showWalkthrough()` method.
- `Injector.isWalkthroughLoaded()` method.
- `Injector.isLoadedWalkthroughUnique()` method.
- `Injector.getPushes(success:failure:)` method.
- `deviceID` parameter from `client.applicationStarted` event. It was redundant with the `deviceId` parameter.
- `SNRPublicKeyPinningAlgorithm` enum.

### Deprecated
- `snr_handledAction(url:activity:completionHandler:)` in `SyneriseDelegate`. Use `snr_handledAction(url:source:)` instead.
- `snr_handledAction(deepLink:activity:completionHandler:)` in `SyneriseDelegate`. Use `snr_handledAction(deepLink:source:)` instead.
- `snr_inAppMessageHandledAction(data:deeplink:)` in `InAppMessageDelegate`. Use `snr_inAppMessageHandledAction(data:deepLink:)` instead.

### Changed
- `Synerise.initialize(clientApiKey:)` to `Synerise.initialize(apiKey:)`.
- `Synerise.initialize(clientApiKey:baseUrl:)` to `Synerise.initialize(apiKey:baseUrl:)`.
- `Synerise.changeClientApiKey(clientApiKey:)` to `Synerise.changeApiKey(apiKey:)`.
- `Synerise.changeClientApiKey(clientApiKey:config:)` to `Synerise.changeApiKey(apiKey:config:)`.
- `Client.activateAccount(email:success:failure:)` to `Client.requestAccountActivation(email:success:failure:)`.
- `Client.confirmAccount(token:success:failure:)` to `Client.confirmAccountActivation(token:success:failure:)`.
- `TokenOrigin.oauth` enum value changed to `TokenOrigin.OAuth`.
- Property `identifier` in the `Document` model changed to `uuid`.
- Client module methods with the **success** closure do NOT contain the `isSuccess` parameter now. It was redundant.
- Improvements to stability.


## [4.24.4] - 2025-03-12

### Fixed
- Issue with authentication (all types): when a customer wanted to authenticate another account, the UUID was not regenerated. The problem occurred since version 4.23.4.

### Changed
- Improvements to stability.


## [4.24.3] - 2025-03-03

### Fixed
- Issue that could have caused crash in rare cases when the appGroupIdentifier didn't match the application's configuration.


## [4.24.2] - 2025-02-21

### Fixed
- Issue that could have caused crash in specific cases in the SDK initialization.


## [4.24.1] - 2025-01-02

### Fixed
- The `snr_notificationDidDismiss(notificationInfo:)` method from `NotificationDelegate` is also invoked in background state when the notification is cleared from the notification center.

### Changed
- Optimization of the In-app messaging module.
- Improvements to stability.


## [4.24.0] - 2024-12-20

### Added
- We added the `os` parameter in all events from the SDK (name of the operating system, identically as in the `client.applicationStarted` event).
- We added the `options` parameter in `NotificationServiceExtension.didReceiveNotificationExtensionRequest(request:withMutableNotificationContent:options:)` method with options for push notifications processing.
 
### Changed
- Event `push.dismiss` is sent when the notification is cleared from the notification center (when the related option in `NotificationServiceExtension` is enabled). IMPORTANT! If you want to start tracking `push.dismiss` events from the notification center, make sure to set the **kSNRNotificationServiceExtensionOptionsPushDismissProcessing** option to true when you invoke `NotificationServiceExtension.didReceiveNotificationExtensionRequest(request:withMutableNotificationContent:options:)` method. You might notice an increased number of events due to this change. If you don't enable this setting, the behavior will remain the same as before.


## [4.23.4] - 2024-12-05

### Fixed
- Optimization of the In-app messaging module (definitions are assigned to a specific Synerise API key).
- Potential issue with removing variants from cache when the campaign is paused.
- Potential issue and exception when `UnitPrice` model initializes with incorrect `NSLocale` object or when the system's current locale returns corrupted data.

### Changed
- Improvements to stability.


## [4.23.3] - 2024-11-07

### Fixed
- Potential issues with checking if the app is launched in the background. The SDK set the background mode to true on `UIScene` and SwiftUI based apps. It could cause the app to freeze.


## [4.23.2] - 2024-10-14 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH CHECKING IF THE APP IS LAUNCHED IN THE BACKGROUND (AFFECTS `UIScene` AND SwiftUI BASED APPS). USE VERSION 4.23.3 !!!

### Fixed
- Optimization of the registration for push notifications process. The cache for that request was erroneously removed in version 4.23.0.


## [4.23.1] - 2024-10-08 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH CHECKING IF THE APP IS LAUNCHED IN THE BACKGROUND (AFFECTS `UIScene` AND SwiftUI BASED APPS). USE VERSION 4.23.3 !!!

### Fixed
- Visibility of the `SNRLocalizableStringKey` constants in Objective-C apps using the SDK.

### Changed
- Behavior of the SDK when a module method is invoked before the SDK initialization. In debug builds, it throws an exception (as before) and on release, it logs an error to console.
- Background Tasks feature is manually blocked in hybrid plugins (React Native, Flutter).

### Changed
- Improvements to stability.


## [4.23.0] - 2024-10-02 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH CHECKING IF THE APP IS LAUNCHED IN THE BACKGROUND (AFFECTS `UIScene` AND SwiftUI BASED APPS). USE VERSION 4.23.3 !!!

### Added
- `Synerise.setBackgroundTaskIdentifiers(_:)` method. The new method registers background tasks in the SDK, which will enable registration for push notifications every 20 days when the application is not launched.
- `snr_registerForPushNotificationsIsNeeded(origin:)` method in `SyneriseDelegate`. If implemented, the new method is invoked instead of `snr_registerForPushNotificationsIsNeeded()`.
- `PushNotificationsRegistrationOrigin` enum.

### Changed
- Improvements to stability.


## [4.22.0] - 2024-09-26

### Fixed
- Some potential issues with possible database corruption.

### Added
- `Client.updateAccountBasicInformation(context:success:failure:)` method. The new method updates anonymous users.
- `ClientUpdateAccountBasicInformationContext` model correlated with the new `Client.updateAccountBasicInformation(context:success:failure:)` method.

### Changed
- Optimization of the In-app messaging module.


## [4.21.0] - 2024-09-12 - REMOVED

!!! THIS VERSION HAS BEEN REMOVED DUE TO POTENTIAL ISSUES WITH IN-APP MESSAGE PROCESSING !!!

### Fixed
- Some potential issues with notification processing in `NotificationServiceExtension`. We recommend using the new method for setting notification categories (see below).

### Added
- `Synerise.setNotificationCategories(_:)` method. The new method maintains temporary Synerise notification categories and saves new categories while respecting old categories.
- `Synerise.settings.inAppMessaging.contentBaseUrl` option in settings to let you set the base URL to use for all relative URLs in an in-app message's creation.

### Changed
- Optimization of the In-app messaging module (variants are no longer assigned once more when the profile's UUID changes).
- Improvements to stability.


## [4.20.0] - 2024-08-29

IMPORTANT: In this version of the Synerise SDK, we have initiated the migration from Objective-C to Swift. This will happen step by step, starting with this release. Our main goal is to keep everything fully compatible with previous versions. It means we want to have identical interfaces and methods, so your current code using the Synerise SDK shouldn’t need any changes. We are working hard to make the transition smooth, but please be cautious when updating, and let us know if you notice any issues.

### Changed
- Improvements to stability.


## [4.19.1] - 2024-08-01

### Fixed
- LICENSE file path in CocoaPods podspec file.

### Changed
- Improvements to stability.


## [4.19.0] - 2024-07-25

### Fixed
- Potential issues with Simple Authentication requests.
- Potential issue with slow SDK initialization.

### Added
- We added a new `Synerise.changeClientApiKey(_:config:)` method. It is analogous to `Synerise.changeClientApiKey(slug:success:failure:)`, but allows adding some initialization parameters.
- We added new parameters to the `push.click` event: `clickSource`, `actionType`, `url` and `actionButtonTitle`.

### Changed
- `requestValidationSalt` (Simple Auth) is cleared when  `Synerise.changeClientApiKey(_:config:)` and `Synerise.changeClientApiKey(_:)` methods are invoked without suitable config.
- Improvements to stability.


## [4.18.2] - 2024-07-15

### Changed
- Nullability of the `feedSlug` property in the `ScreenViewApiQuery` model.
- Nullability of the `productID` property in constructor of the `ScreenViewApiQuery` model.
- Improvements to stability.


## [4.18.1] - 2024-07-09

### Changed
- The `filtersJoiner` and `elasticFiltersJoiner` properties in the `DocumentApiQuery` class should be `RecommendationFiltersJoinerRule` type instead of `DocumentFiltersJoinerRule`. `DocumentFiltersJoinerRule` is removed.
- Nullability of the `slug` property in the `DocumentApiQuery` model.
- Improvements to stability.


## [4.18.0] - 2024-07-04

### Added
- We added a`testDelivery` and `journeyId` parameters to tracked notification events (`push.view`, `push.click`, and so on). It describes if the notification was sent as a test notification from a campaign.
- We added a new `Content.generateDocument(apiQuery:success:failure:)` method. It is analogous to `Content.generateDocument(slug:success:failure:)`, but can contain more context parameters provided in a query object.
- We added a new `Content.generateScreenView(apiQuery:success:failure:)` method. It is analogous to `Content.generateScreenView(feedSlug:success:failure:)`, but can contain more context parameters provided in a query object.
- Anchors from Drag & Drop Builder in the In-App editor are interpreted as URL or as deeplink depending on the value.

### Changed
- We added validation of reserved parameters in events. Now, if a parameter is forbidden, it is removed from the parameters and a log is printed.
- Improvements to stability.


## [4.17.1] - 2024-06-19

### Changed
- Change of repository address from https://github.com/Synerise/ios-sdk to https://github.com/Synerise/synerise-ios-sdk for future releases.
- Improvements to stability.


## [4.17.0] - 2024-04-26

### Fixed
- Some potential issues with retrieving system push consent by the SDK. The SDK set the constent to false when the general consent for the application was enabled, but at least one of the following options was disabled: alerts, sounds, badges.

### Added
- `Synerise.settings.tracker.eventsTriggeringFlush` option in settings to let you set the list of event actions which will trigger instant sending of all events in the queue. The default array contains only push event's actions.

### Changed
- Improvements to push notifications registration.
- Improvements to stability.


## [4.16.1] - 2024-04-09

### Fixed
- Nullability of `clientId` property in the `Token` model.


## [4.16.0] - 2024-03-25

### Changed
- Improved mechanism for checking capping in in-app messages. The number of views no longer resets when the account's UUID changes.
- Improvements to stability.


## [4.15.0] - 2024-03-06

### Added
- Global Control Group support for in-app messages. From now on, you can use this feature in in-app messaging communication. This lets you take your marketing efforts to the next level and provides a solid foundation for accurate measurement of campaign effectiveness. Read more at https://hub.synerise.com/docs/settings/configuration/global-control-group/.
- We added a new `Client.authenticate(tokenPayload:authID:success:failure:)` method. This method signs in a customer in with the provided token payload.
- We added a new `Client.getUUIDForAuthentication(authID:)` method. This method retrieves the current UUID or generates a new one from a seed (`authId`).
- `clientId` property in the `Token` model.

### Changed
- We added additional validation for the `Synerise.initialize(clientApiKey:)` and `Synerise.initialize(clientApiKey:baseUrl:)` methods. Now, if you try to initialize the sdk when it's already running, the method is blocked and no action is invoked.
- Improvements to stability.


## [4.14.12] - 2024-02-27

### Fixed
- Some potential issues with notification processing in `NotificationServiceExtension`.

### Added
- `Synerise.settings.sdk.localizable` option in settings to let you localize some strings displayed by the SDK.

### Changed
- Improvements to stability.


## [4.14.11] - 2024-02-06

### Fixed
- Issue with non-scrolling in-app messages.

### Changed
- The delegate method `snr_registerForPushNotificationsIsNeeded()` is invoked when the SDK is initialized completely.
- When the `Client.registerForPush(registrationToken:mobilePushAgreement:success:failure:)` method fails, it invokes the `snr_registerForPushNotificationsIsNeeded()` delegate method after a short delay.

### Changed
- Improvements to stability.


## [4.14.10] - 2023-12-22

### Added
- Swift Package Manager (SPM) support.


## [4.14.9] - 2023-11-30

### Fixed
- Issue with location of some SDK files in the Documents directory. The old location caused the SDK files to be visible in the shared documents directory if the host application file sharing was enabled.
- Potential issue with native notification buttons when Simple Push campaign contained Rich Media (Single Media) or had a custom notification category identifier.

### Changed
- Improvements to stability.


## [4.14.8] - 2023-11-28

### Changed
- The `Synerise.setRequestValidationSalt(_:)` method accepts nil now. `RequestValidationSalt` is not required for Simple Authentication, but we recommend using it for improved security (it needs to be enabled in the Synerise portal first).

## [4.14.7] - 2023-10-12

### Fixed
- The `notificationServiceExtensionDidFailDecryptionWithError(_ error:)` method in `NotificationServiceExtensionDelegate` was not invoked in some cases when decryption failed.
- The `push.decryptionFailed` event was not sent in some cases when decryption failed.

### Added
- `Synerise.settings.inAppMessaging.shouldSendInAppCappingEvent` option in settings to enable or disable sending `inApp.capping` event by the SDK.

### Changed
- Improvements to stability.


## [4.14.6] - 2023-09-26

### Added
- `Synerise.setHostApplicationSDKPluginVersion(_:)` method which specifies the version of the Synerise SDK plugin in the host application.

### Changed
- Improvements to stability.


## [4.14.5] - 2023-09-12

### Fixed
- Potential in-app messaging issue that could have caused blank screen after dismissing a modal displayed over an in-app message. This problem occurred in a specific view hierarchy and modal presentation style when the in-app message template was `TOP_BAR` or `BOTTOM_BAR`.


## [4.14.4] - 2023-08-31

### Added
- `.anonymous` and `.google` in `TokenOrigin` enumeration type.
- LICENCE for the SDK.

### Changed
- `ClientStateDelegate` for handling client sign-in state is also invoked when a customer uses Simple Authentication.
- The `snr_notificationDidReceive(notificationInfo:)` method in `NotificationDelegate` is also invoked in foreground state and in the host app after clicking on notification and move to app.

### Changed
- Improvements to stability.


## [4.14.3] - 2023-08-04

### Fixed
- The issue that could have caused incorrect sorting of in-app messages.
- Potential issues with Simple Authentication requests.

### Added
- `tags` property in the `ClientSimpleAuthenticationData` model.

### Changed
- Improvements to stability.


## [4.14.2] - 2023-08-01

### Fixed
- The issue that could have caused a customer sign out in some cases when a customer context was changed.
- Potential issues with sharing data sources related to using `Synerise.setRequestValidationSalt(_:)` before SDK initialization.

### Changed
- Improvements to stability.


## [4.14.1] - 2023-07-28

### Fixed
- `Promotion` model mapping caused in previous versions (3.13.2 and 3.14.0).
- Potential issues related to validating models from the SDK due to redundant data (if result model is Dictionary).
- AutoTracking `.plain` mode that sent other events than it should (now, it send only `screen.view` events).


## [4.14.0] - 2023-07-12

### Added
- New authentication mechanism - Simple Authentication. It allows identification of customers without implementing more complicated processes such as RaaS, OAuth, or authenticating by third party services, for example Facebook or Apple. Simple Authentication needs only two methods - `Client.simpleAuthentication(data:authID:success:failure:)` to recognize a customer and `Client.isSignedInViaSimpleAuthentication()` to check if the customer is signed in and uses the Simple Authentication feature. The `Client.signOut()` method and similar methods are a common way to sign out and clear the user context.
- We added a new `Client.registerForPush(registrationToken:success:failure:)` method. It is analogous to `Client.registerForPush(registrationToken:mobilePushAgreement:success:failure:)`, but doesn't require the`mobilePushAgreement` parameter and thanks to that, it doesn't update the customer in the database.

### Changed
- We changed the behavior when a customer context changes. Now, events that were queued before the context change are force-sent to the previous client profile.
- Improvements to stability.


## [4.13.2] - 2023-07-20

### Added
- We have introduced new extra parameters within the internal screen.content event. This event is sent whenever a screen view is generated, providing information about the specific screen view such as document UUIDs, document slugs, and crucial meta parameters of a document used in a screen view.


## [4.13.1] - 2023-05-29

### Fixed
- Potential issues related to banner trigger automation.
- In-app events (inApp.capping, inApp.renderFail, inApp.controlGroup) didn't contain the `variantId` parameter, now it's fixed.

### Changed
- We added additional validation for the `Synerise.changeClientApiKey(clientApiKey:)` method. Now, you try to change the current API key to the same one, it's blocked and no action is invoked.
- We updated terminology in header files from 'client API key` to 'profile API key'.


## [4.13.0] - 2023-05-24

### Added
- We added a new `Content.generateDocument(slug:success:failure:)` method. It's analogous to `Content.getDocument(slug:success:failure:)`. The old method is deprecated. The new method generates the document that is defined for the provided slug.
- We added a new `Content.getRecommendationsV2(options:success:failure:)` method. It's analogous to `Content.getRecommendations(options:success:failure:)`. The old method is deprecated. The new method gets recommendations that are defined for the options provided.
- We added a new `Content.generateScreenView(feedSlug:success:failure:)` method. It's analogous to `Content.getScreenView(success:failure:)`. The old method is deprecated. The new method generates a customer's highest-priority screen view campaign that is defined for the provided slug.
- We added models correlating with new methods: `ScreenView`, `Document`.

### Changed
- `Content.getDocument(slug:success:failure:)` is deprecated now.
- `Content.getDocuments(apiQuery:success:failure:)` is deprecated now.
- `Content.getRecommendations(options:success:failure:)` is deprecated now.
- `Content.getScreenView(success:failure:)` is deprecated now.


## [4.12.2] - 2023-05-15

### Changed
- Optimalization of the In-app messaging module.
- Optimalization of the SDK data management.
- Improvements to stability.


## [4.12.1] - 2023-04-27

### Changed
- Default value of `recommendationEventType` property in `ContentWidgetRecommendationsOptions` to `.seen` for backward compatibility.


## [4.12.0] - 2023-04-11

### Fixed
- Added re-downloading in-app definitions after in-app cache operations fail after a HTTP 304 response from the API.
- Reinitialization of the SDK is now synchronized with the SDK launch and can be invoked anytime.

### Changed
- Improvements to stability.

### Added
- `RecommendationViewEvent` for sending events with recommended item identifiers in one frame.
- `recommendationEventType` property in `ContentWidgetRecommendationsOptions` to choose whether to send `RecommendationSeenEvent` for each recommendation separately or `RecommendationViewEvent` for all recommendations in one frame.


## [4.11.0] - 2023-03-27

### Changed
- Creation time of an event is now updated when the event is passed to the SDK by `Tracker.send(_:)` method.

### Added
- We added a new `Client.signOut(mode:fromAllDevices:success:failure:)` method. It is analogous to `Client.signOut(mode:)`. It is an asynchronous method and notifies the backend that the client is signed out and determines if all other devices should be signed out too. Remember, `signOutWithSessionDestroy` mode clears the anonymous session and regenerates the client UUID. The `Client.signOut(mode:)` method is deprecated now.


## [4.10.1] - 2023-02-20

### Fixed
- The issue that could have caused a crash in some cases in in-app cache operations when API returned error status.
- The `snr_notificationDidDissmis(notificationInfo:)` method in `NotificationDelegate` contains the spelling mistake in the name and it is replaced with a new method with a correct name - `snr_notificationDidDismiss(notificationInfo:)`. The previous method is deprecated for backward compatibility and will be removed from the 5.0.0 version of the SDK.

### Changed
- Excess of anonymous log-in requests has been removed.
- Improvements to stability.


## [4.10.0] - 2023-01-12

### Fixed
- Issue of an additional in-app alert not being displayed when a simple push with action buttons was received in the foreground (existed since version 4.8.0).

### Added
- `NotificationDelegate` for better handling of events from simple push notifications. These delegate methods are invoked when a notification is received, clicked, or dismissed. Additionally, these methods are invoked with a `NotificationInfo` object passed in them, which provides the payload and info about the campaign.


## [4.9.1] - 2023-01-09

### Fixed
- Formatting application name containing special chars to user-agent in networking requests.
- Proper respecting `Synerise.settings.tracker.autoTracking.excludedViewTags` for view controllers in autotracking.

### Changed
- Improvements to stability.


## [4.9.0] - 2022-12-09

### Fixed
- Issue that could have caused crash in some cases in networking session management.

### Added
- `Synerise.settings.inAppMessaging.maxDefinitionUpdateIntervalLimit` option in settings to set maximum interval between automatic In-app definition updates. The minimum and default value is 600 seconds (10 minutes).

### Changed
- The minimum value for `Synerise.settings.inAppMessaging.renderingTimeout` is changed to 1 second.
- Optimalization of the In-app messaging module.
- Optimalization of the SDK data management.
- Improvements to stability.


## [4.8.1] - 2022-12-01

### Fixed
- Optimization of networking requests setup to avoid issues with missing headers.


## [4.8.0] - 2022-11-30

### Fixed
- Potential In-app messaging issue which caused presenting in-app message when the user was not in the required segment.
- Issue with In-app messaging database execute operations which caused crash when the SDK could not open persistent store for the database.
- In-app messaging triggering issues in some cases. The module was enabled too late, so for example triggering `push.click` events when the app was closed was not possible.
- Potential issues with in-app messages processing when the sdk is reinitialized.
- Memory management problems when in-app message was hidden. They were caused by implementing `SyneriseDelegate` methods to handle the SDK actions and choosing `SyneriseActivityActionHide` as the activity action.
- Issue with in-app messaging mechanisms causing a crash when the SDK could not open the database.
- Potential issue with maintaining anonymous token for networking requests when customer context is changed.

### Added
- `SRInApp.hide` method to JS interface in the In-app messaging module. This method instantly hides the currently presented in-app message. This method is similar to `SRInApp.close`, but it is not recognized as user discard.
- `SRInApp.hideAndTrigger` method to JS interface in the In-app messaging module. This method allows triggering the next in-app message instantly after the current message is hidden. The method sends an event built from the provided parameters. This method is similar to `SRInApp.closeAndTrigger`, but it is not recognized as user discard.


## [4.7.0] - 2022-10-31

### Fixed
- Rotation issue after an SDK activity is closed. When an activity was closed, the rotation of the view controller under it was blocked.
- Default action handling for URL and deeplink when delegate was not set. When `SyneriseDelegate` was not set, default actions were not invoked.

### Added
- `SRInApp.closeAndTrigger` method to JS interface in the In-app messaging module. This method allows triggering the next in-app message instantly after the current message is closed. The method sends an event built from the provided parameters.

### Changed
- All the SDK delegate reference types from weak to strong. This is for secure host app implementation and de-allocating objects by ARC.
- `Synerise.settings.inAppMessaging.renderingTimeout` default value from 2 to 5.
- Exclude unwanted SwiftUI maintaining view controllers from AutoTracking.
- Improvements to stability.


## [4.6.2] - 2022-10-14

### Fixed
- In-app message timeout mechanism: even though an in-app message timed out, it was was rendered.
- Unnecessary sending of the `inapp.show` event when rendering a timed-out in-app message.
- Crash occurring when re-initialization was performed instantly after initialization.
- Issues with mapping response in the `Promotions.getAssignedVoucherCodes(success:failure:)` method.

### Changed
- The `action` parameter in in-app messaging error messages was changed from `inApp.jinjaRenderFail` to `inApp.renderFail`.
- Improvements to stability.


## [4.6.1] - 2022-10-04

### Fixed
- Fix with presenting in-app messages for SwiftUI.

### Changed
- Improvements to stability.


## [4.6.0] - 2022-10-03

### Added
- We added in-app messaging module. In-app messages are designed to enhance the user experience in your mobile application without ever being intrusive. Customizable layouts can personalize content and style to create the perfect in-app message to fit your brand. Using Synerise segmentation, you can target and engage the most relevant audience.

### Removed
- `Injector.getBanners` method.
- `Injector.fetchBanners(success:failure:)` method.
- `Injector.showBanner(_:markPresented:)` method.


## [4.5.0] - 2022-09-15

IMPORTANT: 
- Due to recommendations and deprecations introduced by Apple, armv7, armv7s (iOS devices), and i386 (iOS Simulator) architectures are no longer supported.
- Support for iOS 9 and 10 will end soon and the minimum deployment target will change to iOS 11.
- Support for bitcode will end soon.

### Fixed
- Issues with thread prioritization (iOS 16 issues detected by Thread Performance Checker).

### Changed
- End support for armv7, armv7s (iOS devices) and i386 (iOS Simulator).
- Improvements to stability.


## [4.4.1] - 2022-07-19

### Fixed
- Potential issues related to sharing data with notification extensions.

### Changed
- Improvements to stability.


## [4.4.0] - 2022-06-28

### Added
- We added a new `Client.signOut(mode:)` method with two modes: `.signOut` and `.signOutWithSessionDestroy`. They both notify the backend that the client is signed out, clear the client session on the device with a JWT Token, and work similiarly to `Client.signOut()`. Additionaly, `signOutWithSessionDestroy` clears the anonymous session and regenerates the client UUID.


## [4.3.0] - 2022-06-20

### Added
- New labels in Content Widget: 'subtitle', 'identifier' and 'loyaltyPoints'. These properties are added to `ContentWidgetBasicProductItemLayout` and are provided with customization properties such as inserts, font, font color, and an additional label for loyalty points as suffix text. Appearance of the properties is set in `ContentWidgetBasicProductItemLayout` and their data in `ContentWidgetRecommendationDataModel`. All properties are optional and will not be displayed if they were not set it in the data model.


## [4.2.0] - 2022-06-14

IMPORTANT: Distribution of this version changed from Framework to XCFramework to provide support for Apple Silicon chips, SPM (in future) and also to adapt a new way of distributing frameworks by Apple that help to organize binaries for multiple platforms and debug symbols (dSYM, BCSymbols) better.

Remember, that the old way of distributing fat framework is still available and it could be downloaded from GitHub (path: 'SDK/framework') and from GitHub releases (https://github.com/Synerise/ios-sdk/releases).

### Changed
- The way of distributing framework by CocoaPods: from Framework to XCFramework.

### Added
- Additional validation of Synerise notification payload in `NotificationServiceExtension`. Developers had to check whether the notification contains the Synerise payload before passing it to `NotificationServiceExtension`. Now, additionally, `NotificationServiceExtension` checks it internally and rejects the notification when it is not valid Synerise payload format.


## [4.1.1] - 2022-05-29

### Fixed
- Some clients have issue with correct value of `sdkVersion` in AppStarted event, which propably occurs depending to project settings. We have changed it to save hardcoded value so it will solve those issues permanently.
- We found issue with synchronizing data for notification encryption purposes in some cases and we have fixed it.
- We have added Swift name for `SNRToken` class so now that class supports Swift naming style and it is visible as `Token` name.
- `customId` property in `Token` class should not be nonnull type and it has changed to optional.


## [4.1.0] - 2022-05-17

### Changed
- Events types to "custom". Events now can be distinguished via action parameter.


## [4.0.1] - 2022-05-10

### Fixed
- Swift names for some public classes.

### Changed
- Improvements to stability.


## [4.0.0] - 2022-05-05

IMPORTANT: This major version does not change compatibility.

### Fixed
- Potential issue with reading and saving SDK version metadata from the SDK bundle.
- Potential issues related to sharing data with extensions.

### Added
- JWT Token encryption support cooperating with backend.
- `NotificationServiceExtensionDelegate` for better error handling in Notification Service Extension.
- `NotificationServiceExtension.serviceExtensionTimeWillExpireRequest(_:withMutableNotificationContent:)` method in Notification Service Extension.

### Changed
- Deeplinks from campaigns have default action now when delegate method is not implemented - the SDK opens url.
- Remove unnecessary anonymous token refresh operations.
- Improvements to stability.

### Removed
- `.pinActivationRequired` from `ClientConditionalAuthStatus`.


## [3.12.0] - 2022-07-05

IMPORTANT: Distribution of this version changed from Framework to XCFramework to provide support for Apple Silicon chips, SPM (in future) and also to adapt a new way of distributing frameworks by Apple that help to organize binaries for multiple platforms and debug symbols (dSYM, BCSymbols) better.

Remember, that the old way of distributing fat framework is still available and it could be downloaded from GitHub (path: 'SDK/framework') and from GitHub releases (https://github.com/Synerise/ios-sdk/releases).

### Changed
- The way of distributing framework by CocoaPods: from Framework to XCFramework.


## [3.11.2] - 2022-06-15

### Fixed
- Some clients have issue with correct value of sdkVersion in AppStarted event, which propably occurs depending to project settings. We have changed it to save hardcoded value so it will solve those issues permanently.
- Swift names for some public classes.


## [3.11.1] - 2022-04-28

### Fixed
- Potential issue with sending `push.view` events in notification services.
- Incorrect type for `extras` property in `RecommendationResponse` model.


## [3.11.0] - 2022-04-13

### Changed
- `variantId` is sended as number, instead of string in events.

### Added
- Various parameters in `RecommendationOptions` to get recommendations in `Content.getRecommendations(options:success:error:)` method.
- `RecommendationResponseExtras` and `RecommendationResponseExtrasSlot` models.
- Mapping `extras` property (`RecommendationResponseExtras`) in `RecommendationResponse` model.


## [3.10.0] - 2022-03-08

### Added
- `productIDs` parameter in `RecommendationOptions` to get recommendations for multiple items in `Content.getRecommendations(options:success:error:)` method.


## [3.9.1] - 2022-03-02

### Fixed
- Potential issue with native notification buttons when Simple Push campaign contains Rich Media (Single Media).


## [3.9.0] - 2022-02-08

### Fixed
- Analytics for Simple Push campaigns.


## [3.8.10] - 2021-12-13

### Added
- Optional badge as a text shown on the item in `ContentWidget`.
- Optional label (`topTextLabel`) to show additional information about product in `ContentWidget`.
- Label with percentage discount (if set `isDiscountPercentageVisible` in item layout) value shown before sale price in `ContentWidget`.

### Changed
- The SDK does not throw exception when data model mapping returns nil or required properties are nil.
- `ClientAuthenticationResult` is changed to `ClientConditionalAuthResult`.
- `ClientAuthenticationStatus` is changed to `ClientConditionalAuthStatus`.
- `ClientAuthenticationContext` is changed to `ClientConditionalAuthenticationContext`.

### Removed
- `salePriceMargin` setting property from `BasicProductItemLayout`.


## [3.8.9] - 2021-11-05

### Added
- Mapping `errorCode` in `ApiError`.


## [3.8.8] - 2021-11-02

### Fixed
- Potential issues with deprecated OAuth, Facebook and Apple Sign In methods.
- Potential issues with SDK reinitialization.
- Potential issues with merging anonymous profile when client has signed in.

### Added
- `context` parameter in `Client.authenticateConditionally(token:clientIdentityProvider:authID:context:success:failure:)`


## [3.8.7] - 2021-10-15

### Fixed
- Potential issues with cleaning bearer token in HTTP requests.

### Changed
- `ClientSessionEndReason.ClientDeleted` is changed to `ClientSessionEndReason.UserAccountDeleted`.

### Added
- `ExactPrice` value in `PromotionDiscountType` model.


## [3.8.6] - 2021-09-28

### Added
- `ClientSessionEndReason.ClientDeleted` as reason when client deletes account.


## [3.8.5] - 2021-09-12

### Changed
- Internal validation for network request is disabled.


## [3.8.4] - 2021-09-06

### Fixed
- Issues with the SDK reinitialization process.


## [3.8.3] - 2021-09-01

### Fixed
- mapping `currentRedeemLimit` property in `Promotion` model.

### Changed
- nullability of properties in `Promotion` model.

### Added
- `lastingTime` property in `Promotion` model.
- `PromotionTypeHandbill` value in `PromotionType` model.

## [3.8.2] - 2021-08-22

### Fixed
- Issue with token refreshing occuring by SDK in version 3.8.1.

### Added
- `Promotions.activatePromotions(identifiers:success:failure:)` method.
- `Promotions.deactivatePromotions(identifiers:success:failure:)` method.
- `Promotion` model has got new properties.


## [3.8.1] - 2021-08-15

### Fixed
- dSYM content removed from inside framework bundle.


## [3.8.0] - 2021-08-09

### Added
- `Client.requestAccountActivationByPin(email:success:failure:)` method.
- `Client.confirmAccountActivationByPin(pinCode:email:success:failure:)` method.
- `SNRClientSessionEndReasonClientRejected` option in `SNRClientSessionEndReason` enumeration.

### Changed
- Improvements to stability.


## [3.7.6] - 2021-06-30

### Fixed
- UUID regeneration is performed automatically when the session is recovered from the client token after app reinstall.

### Added
- `Client.signInConditionally(email:password:success:failure:)` method.
- `Client.authenticateConditionally(token:clientIdentityProvider:authID:success:failure:)` method.
- `Client.authenticate(token:clientIdentityProvider:authID:success:failure:)` method.
- `ClientAuthenticationResult` model.
- `ClientAuthenticationStatus` enum.


## [3.7.5] - 2021-05-18

### Changed
- `VoucherStatus` is changed to `VoucherCodeStatus`.

### Fixed
- Client UUID is renewed after reinstallation when session is valid.


## [3.7.4] - 2021-04-15

### Fixed
- Potential issues in generating screen.content event.
- Compatibility both for `String` and `Data` types in method that uses Sign in with Apple.


## [3.7.3] - 2021-04-11

### Fixed
- Issue with Recommendations v2 mapping caused in previous version (3.7.2).
- Potential issue with sending double push.view event in some cases.

### Changed
- `AddedProductToCartEvent` is changed to `ProductAddedToCartEvent`.
- `RemovedProductFromCartEvent` is changed to `ProductRemovedFromCartEvent`.
- `AddedProductToFavoritesEvent` is changed to `ProductAddedToFavoritesEvent`.
- `ProductViewEvent` is changed to `ProductViewedEvent`.

### Added
- Additional UIKit classes excluded from AutoTracking.


## [3.7.2] - 2021-04-08

### Fixed
- `ScreenViewResponse` model mapping (`data` property issue).
- Potential issues with fetching Recommendations v1 campaign which is not compatible.

### Added
- More debug events.


## [3.7.1] - 2021-03-30

### Fixed
- Potential issues with regenerating anonymous after an account is deleted.

### Changed
- `CancelledPushEvent` name to `PushCancelledEvent`.
- `Client.requestEmailChange(email:password:success:failure:)` is deprecated.
- `Client.requestEmailChangeByFacebook(email:success:failure:)` is deprecated.

### Added
- `Client.requestEmailChange(email:password:externalToken:authID:success:failure:)` method.
- `Content.getScreenView(success:failure:)` method.


## [3.7.0] - 2021-02-24

### Changed
- Some of deprecated methods have been deleted.
- `NSError` is changed to `SNRApiError` in failure blocks in module methods.

### Added
- `ContentWidget` is supporting Recommendations v2.
- `ContentWidgetRecommendationOptions` configuration object for `ContentWidget`.
- `imageContentMode` in `ContentWidgetBasicProductItemLayout`.


## [3.6.27] - 2021-02-13

### Fixed
- Some issues with fetching notification encryption data when device is locked.


## [3.6.26] - 2021-01-27

### Fixed
- Issue with Push Notification registration after SDK is reinitialized.

### Added
- More debug logs.


## [3.6.25] - 2021-01-21

### Fixed
- Currency issues on `ContentWidget`.

### Changed
- Improvements to stability.


## [3.6.24] - 2021-01-12

### Fixed
- Issue that could have caused loading images with delay in campaigns.

### Changed
- UI improvements in Banner campaign.
- Improved appearance of Simple Push with Rich Media for Dark Mode.
- Improvements to stability.


## [3.6.23] - 2020-12-11

### Changed
- Improvements to stability.


## [3.6.22] - 2020-12-10

### Fixed
- Issue that causes not sending events for Walkthrough and Banner campaigns.


## [3.6.21] - 2020-12-07

### Fixed
- Issue that could have caused crash in `Client.retrieveToken(success:failure:)`. 
- Issue that fix crash in `ContentWidget` when displaying image in `BasicProductItemLayout`.

### Changed
- `[MODULE].setLoggingEnabled(_:)` methods are deprecated. Please use `Synerise.setDebugMode(_:)` only.

### Added
- Single Image Notification (Rich Media) displays title and body on extended view.


## [3.6.20] - 2020-12-01

### Fixed
- `InjectorWalkthroughDelegate` delegate method `snr_walkthroughDidLoad(walkthroughDictionary:)` is invoked when it is implemented instead of old method  `snr_walkthroughDidLoad()`.
- Preventing from displaying campaign when image resources are not formatted correctly.

### Changed
- SDK throws `SNRInternalInconsistencyError` when some settings options are configured after Synerise initialization but should be before.



## [3.6.19] - 2020-11-24

### Fixed
- Some issues with notification processing in `NotificationServiceExtension`.

### Added
- Walkthrough dictionary returned in `InjectorWalkthroughDelegate` delegate method `snr_walkthroughDidLoad(walkthroughDictionary:)`
- `Client.deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:)` method.
- New option to set whether events should be sent when server time synchronization has failed - `Synerise.settings.tracker.isBackendTimeSyncRequired`.

### Changed
- Information about device root is moved to AppStarted event.
- Improvements to stability.


## [3.6.18] - 2020-10-29

### Changed
- Improvements to stability.


## [3.6.17] - 2020-10-14

### Fixed
- Some issues with notification encryption configuration when regenerating data.
- Issue that could have caused crash in `SyneriseCrashHandler`. 

### Changed
- Debug logs contain simple module name, not a class name.
- Improvements to stability.

### Removed
- `Chat` module.


## [3.6.16] - 2020-09-28

### Added
- Image thumbnail in Rich Media (Single Media) Synerise notification.
- Dynamic interactive iOS buttons in Synerise notifications generated from Simple Push campaign.

### Changed
- Implementing encrypted notifications is now easier.


## [3.6.15] - 2020-09-07

### Added
- Support for encrypted notifications (enabled by `Synerise.settings.notifications.encryption`).


## [3.6.14] - 2020-08-24

### Added
- Events sends own occuring time to backend.

### Changed
- `Synerise.settings.notifications.appGroupIdentifier` is moved to `Synerise.settings.notifications.appGroupIdentifier`. The previous option is active but deprecated.


## [3.6.13] - 2020-07-16

### Added
- `automaticallyAdjustContentViewSize`  bool property for specify whether expanded notification should automatically adjust its size to downloaded image.


## [3.6.12] - 2020-07-07

### Fixed
- Issues with generating UUID for Apple Sign In authentication requests.

### Added
- `TokenOriginApple` in `TokenOrigin` enumeration type.


## [3.6.11] - 2020-07-01

### Added
-  `Client.authenticateByOAuthIfRegistered(accessToken:authID:success:failure:)` method.
-  `Client.authenticateByAppleSignInIfRegistered(identityToken:authID:success:failure:)` method.
- `Client.deleteAccountByOAuth(accessToken:success:failure:)` method.
- `Client.deleteAccountByAppleSignIn(identityToken:success:failure:)` method.
- `Synerise.settings.sdk.shouldDestroySessionOnApiKeyChange` in settings.

### Changed
- Maintaining session when changing clientApiKey within business profile.


## [3.6.10] - 2020-06-19

### Changed
- Improvements to stability.


## [3.6.9] - 2020-06-18 (removed from CocoaPods)

### Added
- Content mode settings for image views in Rich Media notifications.

### Changed
- Way of obfuscation in SDK to much pretty style.


## [3.6.8] - 2020-05-14

### Fixed
- Freezeing host app issue occuring sometimes by SDK in version 3.6.7.


## [3.6.7] - 2020-05-13

### Fixed
- Freezeing host app issue occuring sometimes by SDK in version 3.6.6.

### Added
-  `Client.refreshToken(sucess:failure:)` method.
- `Token` object has claims property with properties of token.

### Changed
- Improvements to stability.


## [3.6.6] - 2020-04-30

### Added
- Persistent events are sent when the app launches.

### Changed
- Improvements to stability.


## [3.6.5] - 2020-04-15

### Fixed
- Passing attributes property in OAuth authorization context.

### Added
- `Client.destroySession` method.
- `Client.regenerateUuid(clientIdentifier:)` method with customerIdentifier as input for regenerated uuid.
- Apple Sign In authorization (`Client.authenticateByAppleSignIn(context:authID:success:failure:)`).
- Swift names for some public classes.

### Changed
- Error codes for `Error` are enumeration type now.
- Improvements to stability.


## [3.6.4] - 2020-03-25

### Fixed
- saving events in persistent storage.


## [3.6.3] - 2020-03-16

### Fixed
- Issue with removing data from keychain when app is launched first.

### Added
- More information in `CrashEvent` from Crash Handler.


## [3.6.2] - 2020-03-02

### Changed
- Improvements to supporting synerise react native sdk.


## [3.6.1] - 2020-02-27

### Added
- `Synerise.setHostApplicationType` method to specify host app type.

### Changed
- `Tracker` tries to send events when app enters to foreground.
- Better handling when there is no internet connection.
- Improvements to stability.

## [3.6.0] - 2020-02-13

### Changed
- Improvements to stability.


## [3.5.20] - 2020-02-12

### Changed
- Security related changes.

### Removed
- `tags` property in `ClientUpdateAccountContext` and `ClientRegisterAccountContext`.


## [3.5.19] - 2020-01-23

### Added
- `authId` as `customId` in OAuth authorization payload.

### Changed
- Improvements in reinitialization mechanism (`Synerise.changeClientApiKey`).

## [3.5.18] - 2019-12-20

### Fixed
- `Promotion.priority` property added to sorting whitelist.
- Improving SDK stability


## [3.5.17] - 2019-12-12

### Added
- `priority` property in `Promotion` class.


## [3.5.16] - 2019-12-09

### Fixed
- Uncommon case with stop tracking events because of invalid events in batch.


## [3.5.15] - 2019-12-03

### Added
- Support multiple scenes in campaigns (walkthrough, banner etc.) for iOS 13.


## [3.5.14] - 2019-12-02

### Fixed
- `ContentWidgetImageButtonCustomAction` sends model in its receive click action.

### Added
- SDK persists its last and current version in application's data.

### Changed
- `PromotionResponse` mapping metadata to `PromotionResponseMetadata` object in metadata property.
- `Client.registerForPush(mobileAgreement:success:failure:)` is deprecated.


## [3.5.13] - 2019-11-22

### Fixed
- `ContentWidget` doesn't require productID parameter for recommendations.


## [3.5.12] - 2019-11-07

### Changed
- `Client.regenerateUUID` method regenerates client's UUID if session is anonymous.

### Fixed
- `Token.tokenString` property attributes.
- `ClientRegisterAccountContext.city` property mapping.

### Removed
- `ClientUpdateContext.lastActivityDate`.


## [3.5.11] - 2019-10-18

### Added
- `regularPriceFont` and `regularPriceFontColor` properties to `ContentWidgetBasicProductItemLayout`.
- `priceGroupSeparator` and `priceDecimalSeparator` properties  to `ContentWidgetBasicProductItemLayout`.


## [3.5.10] - 2019-10-16

### Added
- `Content.getDocuments(apiQuery:success:failure:)` method.


## [3.5.9] - 2019-10-08

### Added
- `Synerise.setCrashHandlingEnabled(_:)` to pass info about Users application crashes as dedicated events to the backend.


## [3.5.8] - 2019-09-27

### Added
- `ClientStateDelegate` for handling client sign-in state.


## [3.5.7] - 2019-09-20

### Added
- `SIGN_OUT` SDK Command.

### Changed
- `Chat` constructor requires `tracker_key`.


## [3.5.6] - 2019-09-10

### Added
- `Chat` module.

### Changed
- Improvements to stability.


## [3.5.5] - 2019-09-03

### Added
- `OTHER` option to `ClientSex`.


## [3.5.4] - 2019-08-19

### Added
- Sale price as a additional feature to `ContentWidge`.
- Optional button action as a additional feature to `ContentWidget`.


## [3.5.3] - 2019-08-12

### Added
- `Client.getEvents()` method.
- 'app-version' as a query parameter in walkthrough request.

### Changed
- Event's label max length is 64 characters.

## [3.5.2] - 2019-07-25

### Added
- `PromotionsApiQuery` object to fetch promotions better way.
- 'mobilePushAgreement' parameter in `Client.registerForPush()` method.

### Changed
- `WidgetGridLayout.getSize(prefferedWidth:)` name to `WidgetGridLayout.getSize(preferredWidth:)`.
- `Client.getPromotions(statuses:types:page:success:failure:)` is deprecated.
- `Client.getPromotions(statuses:types:limit:page:success:failure:)` is deprecated.
- `Client.getPromotions (statuses:types:limit:page:includeMeta:success:failure:)` is deprecated.


## [3.5.1] - 2019-07-10

### Fixed
- `ContentWidgetItemLayout.backgroundColor` - property type.
- Swift name for `RecommendationOptions` class.

### Changed
- Documentation in header files.


## [3.5.0] - 2019-06-30

### Added
- 'ContentWidget' with Slider and Grid Layouts.


## [3.4.14] - 2019-06-27

### Fixed
- Header annotation in `Client.recognizeAnonymous()`


## [3.4.13] - 2019-06-25

### Removed
- Transaction Events (`CompletedTransactionEvent`, `CancelledTransactionEvent`).

### Added
- Network information is sent in the `ApplicationStartedEvent`.
- Mobile Operator information is sent in the `ApplicationStartedEvent`.


## [3.4.12] - 2019-06-22

### Fixed
- `Client.setCustomEmail` and `Client.setCustomIdentifier` methods nullability.

### Removed
- Events don't contain 'time' parameter.

### Changed
- Improvements to networking.


## [3.4.11] - 2019-06-12

### Added
- `Client.retrieveToken(success:failure:)` method

### Changed
- `Client.getToken(success:failure:)'`is deprecated.


## [3.4.10] - 2019-06-04

### Fixed
- `Synerise.settings.sdk.minTokenRefreshInterval` option in settings.

## [3.4.9] - 2019-06-03

### Fixed
- `ClientRegisterAccountContext.tags` property is array now.

### Added
- New option to set time interval counting backwards from expiration time, within which token will be automatically refreshed by SDK  - `Synerise.settings.sdk.minTokenRefreshInterval`.

## [3.4.8] - 2019-05-21

### Fixed
- Dynamic change of AutoTrack mode.

### Added
- `Content` module.
- `Content.getDocument` method.
- Push Consent information is sent in the AppStartedEvent.

### Changed
- `Tracker.setConfiguration()` is deprecated.
- `Tracker.setAutoTrackMode()` is deprecated.
- `Tracker.setLocationAutomaticEnabled()` is deprecated.
- `Injector.setAutomatic()` is deprecated.


## [3.4.7] - 2019-04-26

### Fixed
- Mandatory Update campaign.


## [3.4.6] - 2019-04-09

### Fixed
- Improving SDK stability.


## [3.4.5] - 2019-04-08

### Added
- New option to disable whole SDK activity - `Synerise.settings.sdk.enabled`.
- New option to disable notifications activity - `Synerise.settings.notifications.enabled`.
- New option to disable auto tracking activity - `Synerise.settings.tracker.autoTracking.enabled`.
- New option to disable declarative tracking activity - `Synerise.settings.tracker.tracking.enabled`.


## [3.4.4] - 2019-04-04

### Changed
- `ProductViewEvent`, `RecommendationClickEvent` and `RecommendationSeenEvent` has changed its structure.


## [3.4.3] - 2019-03-29

### Changed
- Synerise API host.


## [3.4.2] - 2019-03-19

### Added
- New additional 'authID' parameter in `Client.authenticateByFacebook()` method.
- New additional 'authID' parameter in `Client.authenticateByOAuth()` method.

### Removed
- `authID` parameter (`ClientFacebookAuthenticationContext`, `ClientOAuthContext`).


## [3.4.1] - 2019-03-18

### Added
- New event classes (`ProductViewEvent`, `RecommendationSeenEvent`, `RecommendationClickEvent`).
- New additional `authID` parameter (`ClientFacebookAuthenticationContext`, `ClientOAuthContext`).

### Changed
- Simple Push campaign doesn't send 'push.received' event by now.


## [3.4.0] - 2019-03-08

### Added
- Posiibility to excluding compontents from autotracking by class.
- Posiibility to excluding components from autotracking by tag.

### Changed
- New structure and code organization for SDK settings (`SNRSynerise.settings`).
- Improvements to user anonymous session.


## [3.3.16] - 2019-03-01

### Changed
- Improvements to user anonymous session.


## [3.3.15] - 2019-02-27

### Changed
- Change to allow anonymous client using whole methods.


## [3.3.14] - 2019-02-21

### Added
- `Client.requestEmailChangeByFacebook()`.


## [3.3.13] - 2019-02-19

### Changed
- Improvements in oauth authentication.


## [3.3.12] - 2019-02-13

### Changed
- Improvements to user session handling.


## [3.3.11] - 2019-02-07

### Fixed
- Facebook authentication.

### Changed
- `Client.requestEmailChange()` method (newsleeterAgreement has been added to arguments).
- `Client.confirmEmailChange()` method (smsAgreement has been added to arguments).


## [3.3.10] - 2019-02-03

### Added
- `Client.authenticateByOAuth()` method.
- `Client.regenerateUUID()` method.

### Changed
- `Client.authenticateByFacebook()` method uses context optionally.
- `Client.requestEmailChange()` method.
- `Client.confirmEmailChange()` method.


## [3.3.9] - 2019-01-23

### Added
- `Synerise.isSyneriseSimplePush()` method.
- `Synerise.isSyneriseSilentCommand()` method.
- `Synerise.isSyneriseSilentSDKCommand()` method.
- `Synerise.isSyneriseBanner()` method.

### Changed
- Autotracking events.


## [3.3.8] - 2019-01-16

### Added
- `Client.authenticateByFacebook()` method.
- `Client.authenticateByFacebookIfRegistered()` method.
- `Client.requestEmailChange()` method.
- `Client.confirmEmailChange()` method.
- `Client.deleteAccountByFacebook()` method.

### Removed
- `Client.authenticateByFacebookToken()` method.

### Changed
- `Client.getToken()` returns token and its origin (SYNERISE, FACEBOOK, OAUTH or UNKNOWN).

### Fixed
- Improving SDK stability.


## [3.3.7] - 2019-01-09

### Added
- `Synerise.locationAutomatic()` method to obtain user location and send location event automatically.

### Fixed
- Improving SDK stability.


## [3.3.6] - 2018-12-18

### Changed
- `Client.deleteAccount()` method.


## [3.3.5] - 2018-12-16

### Added
- `Client.confirmAccount()` method.

### Changed
- `Client.deleteAccount()` method requires password.

### Fixed
- `Client.updateAccount()` method. Unless sex property in update context is set, api request payload doesn't contain it.

### Removed
- `Client.registerAccount()` method option to registration without email.


## [3.3.4] - 2018-12-12

### Fixed
- `Promotions.getPromotions()`.


## [3.3.3] - 2018-12-06

### Fixed
- `Promotions.getPromotionByUuid()`.
- `Promotions.getPromotionByCode()`.


## [3.3.2] - 2018-11-28

### Added
- `Synerise.setDebugModeEnabled()` to eneable logs from all modules.

### Changed
- `Loyalty` module is renamed to `Promotions`.
- `CacheService` is replaced by `CacheManager`.
- New functionality in `SNRApiError` (see Error Handling section in README).
- Synerise SDK invokes all delegation methods on main thread.

### Fixed
- Improving Synerise SDK stability.
- Optimisation of networking in Synerise SDK.


## [3.3.1] - 2018-11-21

### Fixed
- Method name for Swift: `Client.registerClient()` -> `Client.registerAccount()`.
- Improving SDK stability.


## [3.3.0] - 2018-11-20

### Added
- `Loyalty` module.
- `CacheService` to obtain cached API models.

### Changed
- SDK callbacks executes on main thread.
- Some Promotion entity fields types.
- Some Promotion enum types (`PromotionStatus`, `PromotionType`, `PromotionDiscountValue`).
- Major parts of authorization module.
- `Client.changePassword()` now requires old client's password.
- Profile methods were distributed between Client and Loyalty.
- `Client.getPromotions()` -> `Loyalty.getPromotions()`.
- `Client.getPromotion()` -> `Loyalty.getPromotion()`.
- `Client.activatePromotionBy()` -> `Loyalty.activatePromotionBy()`.
- `Client.deactivatePromotionBy()` -> `Loyalty.deactivatePromotionBy()`.
- `Client.getOrAssignVoucher()` -> `Loyalty.getOrAssignVoucher()`.
- `Client.assignVoucherCode()` -> `Loyalty.assignVoucherCode()`.
- `Client.getAssignedVoucherCodes()` -> `Loyalty.getAssignedVoucherCodes()`.
- `Profile.registerClient()` -> `Client.registerAccount()`.
- `Profile.registerForPush()` -> `Client.registerForPush()`.
- `Profile.activateClient()` -> `Client.activateAccount()`.
- `Profile.requestPasswordReset()` -> `Client.requestPasswordReset()`.
- `Profile.confirmResetPassword()` -> `Client.confirmPasswordReset()`.

### Removed
- Overall validation.
- `Profile` module.
- `Client.getAnalytics()` method.
- `Client.setConfiguration()` method.
- `Client.createAuthToken()` method.


## [3.2.30] - 2018-11-01

### Added
- Notifications with Rich Media now can have URL actions.

### Changed
- Removed validation for email, birthdate and phone number in several functions in the SDK.
- Added argument validation for nonnull argument in Client and Profile modules (SDK throw `InvalidArgumentException`).


## [3.2.29] - 2018-10-23

### Fixed
- Issue with logout and client's auto refresh.

### Added
- Client method to obtain client's authorization token by Facebook token.
- `ApiError` class with more information from backend system.


## [3.2.28] - 2018-10-18

### Fixed
- Improving SDK stability.


## [3.2.27] - 2018-10-15

### Added
- Option to disable In App Push Notification Alerts.

### Changed
- Client models structure (`ClientAccountInformation`, `ClientUpdateContext`).
- `ClientSex` is now enum type instead of object.

### Removed
- `ClientAgreeementsContext` model (use `ClientAgreeementsContext` instead).


## [3.2.26] - 2018-10-05

### Added
- Client method to obtain external client's authorization token.
- Simple Push campaign sends events to Synerise.
- Password validation is removed in the entire SDK.

### Changed
- Synerise SDK can be initialized at any moment of the application's lifecycle.

### Fixed
- Public methods are more orderly and better described.


## [3.2.25] - 2018-09-26

### Added
- Assign voucher Profile and Client API methods.
- Get assigned vouchers Profile and Client API methods.
- Get or assign voucher Profile and Client API methods.
- New method to deactivate promotion by uuid.
- New method to deactivate promotion by code.
- New method to fetch promotions data with limit parameter.
- New method to fetch promotions data with statuses and expiration options.

### Changed
- Promotions API models structure (`ClientPromotion`, `ProfilePromotion`).
- Method `Profile.activateAccount()` changed to `Profile.activateClient()`.
- Method `Profile.confirmAccount()` changed to `Profile.confirmPhoneRegistration()`.
- Method `Profile.resetPassword()` changed to `Profile.requestPasswordReset()`.


## [3.2.24] - 2018-09-18

### Changed
- Registration method doesn't throw but invoke failure with error.

### Fixed
- Improving SDK stability.


## [3.2.23] - 2018-09-06

### Added
- New Client change password feature (old password validation).

### Fixed
- Improving SDK stability.


## [3.2.22] - 2018-09-03

### Fixed
- Improving SDK stability.


## [3.2.21] - 2018-08-30

### Fixed
- Registration with pool ID.


## [3.2.20] - 2018-08-29

### Added
- New Client change password feature.
- New method to create account without activation.


## [3.2.19] - 2018-08-16

### Added
- Method to request update of phone number.
- Method to confirm update of phone number.
- Method to activate account manually.


## [3.2.18] - 2018-08-13

### Added
- Promotions API integration.


## [3.2.17] - 2018-08-02

### Changed
- Walkthrough and banners appearance.

### Fixed
- SDK stability.


## [3.2.16] - 2018-07-06

### Added
- Bitcode support.
- Option to change API baseURL for on-premise installations.

### Fixed
- Campaign Banners appearance.


## [3.2.15] - 2018-07-03

### Changed
- Synerise activities are now presented via own UIWindow.


## [3.2.14] - 2018-06-28

### Fixed
- Email validator to support all TLDs.


## [3.2.13] - 2018-06-26

### Added
- Automated customId assignation from code pool upon client registration.


## [3.2.12] - 2018-06-22

### Added
- Method to get current client's UUID.
- customId property in `ClientProfileContext`.
- improvements for exceptions/errors handling in obj-c/swift.

### Fixed
- Profile.createClient.


## [3.2.11] - 2018-06-21

### Fixed
- `Profile.deleteClient()`.


## [3.2.10] - 2018-06-18

### Added
- Added analytic matrics support.
- Method to check client is signed in.


## [3.2.9] - 2018-06-11

### Added
- Configuration options for Client (client auto refresh).
- Option to auto refresh client's login.
- Method to set client's email for Tracker.

### Changed
- Method to set client identifier in Tracker.
- Improvement in SDK logging (framework version information added).


## [3.2.8] - 2018-05-29

### Added
- Configuration options for Tracker.

### Changed
- clientId in Tracker is String object by now.


## [3.2.7] - 2018-05-28

### Changed
- Default settings for event sending.


## [3.2.6] - 2018-05-24

### Changed
- Improvements for campaign automation support.


## [3.2.5] - 2018-05-24

### Added
- Option to register with phone number and confirmation with code received by phone.
- Option to login with phone number and password.

### Fixed
- Swift method names (incorrect parameter names in some classes).


## [3.2.4] - 2018-05-16

### Changed
- Swift naming convenction for some classes.


## [3.2.3] - 2018-05-16

### Fixed
- `ClientProfileContext` class visibility to public.


## [3.2.2] - 2018-05-16

### Added
- Validation for email, password, birthdate, phone number in SDK methods (SDK throws exceptions).
- New method for fetching client profile information: `Profile.getClient()`.


## [3.2.1] - 2018-05-10

### Changed
- Property type 'clientId' changed from NSInteger to NSNumber in `CreateClientContext` model.
- Property type 'birthDate' changed from NSDate to NSString in few models: `ClientAccountInformation`, `ClientUpdateAccountContext`, `UpdateClientContext`, `CreateClientContext`.


## [3.2.0] - 2018-05-09

### Added
- Preloading campaign banners.
- Preloaded campaign banners can be triggered by events.

### Changed
- Banner optional delegate methods.


## [3.1.72] - 2018-05-04

### Changed
- Images load before showing mobile campaign (walkthrough, banner).


## [3.1.71] - 2018-04-26

### Changed
- New parameters in view tracking.


## [3.1.70] - 2018-04-25

### Added
- Injector starts automatically or manually.
- Walkthrough optional delegate methods.
- Banner optional delegate methods.
- Mandatory Update and First Run Message support.
- New parameters to AppStartedEvent.
- Placeholder while loading images.

### Removed
- Welcome screen.

### Changed
- SyneriseSDK optional delegate methods.
- New uuid mechanism.
