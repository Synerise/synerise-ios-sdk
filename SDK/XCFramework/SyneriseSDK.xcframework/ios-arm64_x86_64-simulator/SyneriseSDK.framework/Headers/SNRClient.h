//
//  SNRClient.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRTokenOrigin.h>
#import <SyneriseSDK/SNRClientSignOutMode.h>
#import <SyneriseSDK/SNRClientSessionEndReason.h>
#import <SyneriseSDK/SNRClientIdentityProvider.h>
#import <SyneriseSDK/SNRApiError.h>

@class SNRClientEventsApiQuery;
@class SNRClientRegisterAccountContext;
@class SNRClientAuthenticationContext;
@class SNRClientConditionalAuthenticationContext;
@class SNRClientOAuthAuthenticationContext;
@class SNRClientFacebookAuthenticationContext;
@class SNRClientAppleSignInAuthenticationContext;
@class SNRClientConditionalAuthResult;
@class SNRClientSimpleAuthenticationData;
@class SNRClientAccountInformation;
@class SNRClientEventData;
@class SNRClientUpdateAccountBasicInformationContext;
@class SNRClientUpdateAccountContext;
@class SNRClientPasswordResetRequestContext;
@class SNRClientPasswordResetConfirmationContext;
@class SNRToken;
@class SNRTokenPayload;

NS_ASSUME_NONNULL_BEGIN

/**
 * @protocol SNRClientStateDelegate
 *
 * A delegate to handle Client's sign-in state changes.
 */

NS_SWIFT_NAME(ClientStateDelegate)
@protocol SNRClientStateDelegate

@optional

/**
 * This method is called when a customer signs in.
 */
- (void)SNR_clientIsSignedIn NS_SWIFT_NAME(snr_clientIsSignedIn());

/**
 * This method is called when a customer signs out.
 *
 * @param reason Specifies the reason for signing out.
 */
- (void)SNR_clientIsSignedOutWithReason:(SNRClientSessionEndReason)reason NS_SWIFT_NAME(snr_clientIsSignedOut(reason:));

@end


/**
 * @class SNRClient
 */

NS_SWIFT_NAME(Client)
@interface SNRClient : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Sets object for a customer's state delegate methods.
 *
 * @param delegate An object that implements the `SNRClientStateDelegate` protocol.
 */
+ (void)setClientStateDelegate:(id<SNRClientStateDelegate>)delegate;

/**
 * Registers a new client account.
 * Note that you should NOT allow signing in again (or signing up) when a user is already signed in. Sign out the user first.
 * Do not create multiple instances nor call this method multiple times before execution.
 *
 * @param context `SNRClientRegisterAccountContext` object with client's email, password, and other optional data. Fields that are not provided are not modified.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)registerAccount:(SNRClientRegisterAccountContext *)context
                success:(void (^)(BOOL isSuccess))success
                failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(registerAccount(context:success:failure:));

/**
 * Confirms a customer's account.
 *
 * @param token Confirmation token.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmAccount:(NSString *)token
               success:(void (^)(BOOL isSuccess))success
               failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(confirmAccount(token:success:failure:));

/**
 * Activates a customer's account.
 *
 * @param email Client’s email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)activateAccount:(NSString *)email
                success:(void (^)(BOOL isSuccess))success
                failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(activateAccount(email:success:failure:));

/**
 * Requests a customer's account registration process with pin code.
 *
 * @param email Client’s email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestAccountActivationByPinWithEmail:(NSString *)email
                                       success:(void (^)(BOOL isSuccess))success
                                       failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(requestAccountActivationByPin(email:success:failure:));

/**
 * Confirms a customer's account registration process with pin code.
 *
 * @param pinCode Code sent to your email.
 * @param email Client’s email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmAccountActivationByPin:(NSString *)pinCode
                                email:(NSString *)email
                              success:(void (^)(BOOL isSuccess))success
                              failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(confirmAccountActivationByPin(pinCode:email:success:failure:));

/**
 * Signs in a customer in order to obtain a JSON Web Token (JWT) which can be used in subsequent requests.
 * The SDK will refresh the token before each call if it is about to expire (but not expired).
 * Note that you should NOT allow signing in again (or signing up) when a user is already signed in. Sign out the user first.
 * Do not create multiple instances nor call this method multiple times before execution.
 *
 * @param email Client's email.
 * @param password Client's password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)signInWithEmail:(NSString *)email
               password:(NSString *)password
                success:(void (^)(BOOL isSuccess))success
                failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(signIn(email:password:success:failure:));

/**
 * Signs in a customer in order to obtain a JSON Web Token (JWT) which can be used in subsequent requests.
 * The SDK will refresh the token before each call if it is about to expire (but not expired).
 * Note that you should NOT allow signing in again (or signing up) when a user is already signed in. Sign out the user first.
 * Do not create multiple instances nor call this method multiple times before execution.
 *
 * @param email Client's email.
 * @param password Client's password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)signInConditionallyWithEmail:(NSString *)email
                            password:(NSString *)password
                             success:(void (^)(SNRClientConditionalAuthResult *authResult))success
                             failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(signInConditionally(email:password:success:failure:));

/**
 * Signs in a customer with external token (if OAuth, Facebook, Apple etc.).
 *
 * @param token  Client's token (OAuth, Facebook, Apple etc.).
 * @param clientIdentityProvider Client's identity provider.
 * @param authID Authorization custom identity.
 * @param context `SNRClientAuthenticationContext` object with agreements and optional attributes.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateWithToken:(id)token
       clientIdentityProvider:(SNRClientIdentityProvider)clientIdentityProvider
                       authID:(nullable NSString *)authID
                      context:(nullable SNRClientAuthenticationContext *)context
                      success:(void (^)(BOOL isSuccess))success
                      failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(authenticate(token:clientIdentityProvider:authID:context:success:failure:));

/**
 * Signs in a customer with external token (if OAuth, Facebook, Apple etc.).
 *
 * @param token  Client's token (OAuth, Facebook, Apple etc.).
 * @param clientIdentityProvider Client's identity provider.
 * @param authID Authorization custom identity.
 * @param context `SNRClientConditionalAuthenticationContext` object with agreements and optional attributes.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateConditionallyWithToken:(id)token
                    clientIdentityProvider:(SNRClientIdentityProvider)clientIdentityProvider
                                    authID:(nullable NSString *)authID
                                   context:(nullable SNRClientConditionalAuthenticationContext *)context
                                   success:(void (^)(SNRClientConditionalAuthResult *authResult))success
                                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(authenticateConditionally(token:clientIdentityProvider:authID:context:success:failure:));

/**
 * Signs in a customer with OAuth Access Token.
 *
 * @param accessToken OAuth Access Token.
 * @param authID Authorization custom identity.
 * @param context `SNRClientOAuthContext` object with agreements and optional attributes.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.7.6
 */
+ (void)authenticateByOAuthWithAccessToken:(NSString *)accessToken
                                    authID:(nullable NSString *)authID
                                   context:(nullable SNRClientOAuthAuthenticationContext *)context
                                   success:(void (^)(BOOL isSuccess))success
                                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(authenticateByOAuth(accessToken:authID:context:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.authenticate(token:clientIdentityProvider:authID:context:success:failure:)` instead.");

/**
 * Signs in a registered client with OAuth Access Token.
 *
 * @param accessToken OAuth Access Token.
 * @param authID Authorization custom identity.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.7.6
 */
+ (void)authenticateByOAuthIfRegisteredWithAccessToken:(NSString *)accessToken
                                    authID:(nullable NSString *)authID
                                   success:(void (^)(BOOL isSuccess))success
                                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(authenticateByOAuthIfRegistered(accessToken:authID:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.authenticateConditionally(token:clientIdentityProvider:authID:context:success:failure:)` instead.");

/**
 * Signs in a customer with Facebook Token.
 *
 * @param facebookToken Token from an active Facebook session.
 * @param authID Authorization custom identity.
 * @param context `SNRClientFacebookAuthenticationContext` object with agreements and optional attributes.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.7.6
 */
+ (void)authenticateByFacebookWithFacebookToken:(NSString *)facebookToken
                                         authID:(nullable NSString *)authID
                                        context:(nullable SNRClientFacebookAuthenticationContext *)context
                                        success:(void (^)(BOOL isSuccess))success
                                        failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(authenticateByFacebook(facebookToken:authID:context:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.authenticate(token:clientIdentityProvider:authID:context:success:failure:)` instead.");

/**
 * Signs in a registered client with Facebook Token.
 *
 * @param facebookToken Token from Facebook active session.
 * @param authID Authorization custom identity.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.7.6
 */
+ (void)authenticateByFacebookIfRegisteredWithFacebookToken:(NSString *)facebookToken
                                                     authID:(nullable NSString *)authID
                                                    success:(void (^)(BOOL isSuccess))success
                                                    failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(authenticateByFacebookIfRegistered(facebookToken:authID:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.authenticateConditionally(token:clientIdentityProvider:authID:context:success:failure:)` instead.");

/**
 * Signs in a customer with Sign In With Apple.
 *
 * @param identityToken Token from Sign In With Apple session.
 * @param authID Authorization custom identity.
 * @param context `SNRClientAppleSignInAuthenticationContext` object with agreements and optional attributes.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.7.6
 */
+ (void)authenticateByAppleSignInWithIdentityToken:(NSData *)identityToken
                                            authID:(nullable NSString *)authID
                                           context:(nullable SNRClientAppleSignInAuthenticationContext *)context
                                           success:(void (^)(BOOL isSuccess))success
                                           failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(authenticateByAppleSignIn(identityToken:authID:context:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.authenticate(token:clientIdentityProvider:authID:context:success:failure:)` instead.");

/**
 * Signs in a registered client with Sign In With Apple.
 *
 * @param identityToken Token from Sign In With Apple session.
 * @param authID Authorization custom identity.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.7.6
 */
+ (void)authenticateByAppleSignInIfRegisteredWithIdentityToken:(NSData *)identityToken
                                            authID:(nullable NSString *)authID
                                           success:(void (^)(BOOL isSuccess))success
                                           failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(authenticateByAppleSignInIfRegistered(identityToken:authID:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.authenticateConditionally(token:clientIdentityProvider:authID:context:success:failure:)` instead.");

/**
 * Signs in a customer in with the provided token payload.
 *
 * @param tokenPayload `SNRTokenPayload` object with a token's payload.
 * @param authID Authorization custom identity.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateWithTokenPayload:(SNRTokenPayload *)tokenPayload authID:(NSString *)authID success:(void (^)(void))success failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(authenticate(tokenPayload:authID:success:failure:));

/**
 * Signs in a customer with Simple Authentication.
 * Note, that to use this method you have to set request validation salt by `Synerise.setRequestValidationSalt(_:)` method.
 *
 * @param data `SNRClientSimpleAuthenticationData` object with client's data information to be modified. Fields that are not provided are not modified.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)simpleAuthentication:(SNRClientSimpleAuthenticationData *)data
                      authID:(NSString *)authID
                     success:(void (^)(void))success
                     failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(simpleAuthentication(data:authID:success:failure:));

/**
 * Checks if a customer is signed in via Synerise, External Provider or OAuth (if client's token is not expired).
 */
+ (BOOL)isSignedIn;

/**
 * Checks if a customer is signed in via Simple Authentication (if anonymous's token is not expired and its origin is .simpleAuth).
 */
+ (BOOL)isSignedInViaSimpleAuthentication;

/**
 * Signs out the customer.
 * Note that this operation signs out a customer of any type authentication (via Synerise, External Provider, OAuth or Simple Authentication).
 *
 */
+ (void)signOut NS_SWIFT_NAME(signOut());

/**
 * Signs out the customer.
 * Note that this operation signs out a customer of any type authentication (via Synerise, External Provider, OAuth or Simple Authentication).
 *
 * @param mode Logout mode.
 *
 * @deprecated Deprecated in version 4.11.0
 */
+ (void)signOutWithMode:(SNRClientSignOutMode)mode NS_SWIFT_NAME(signOut(mode:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.signOut(mode:fromAllDevices:success:failure:)` instead.");

/**
 * Signs out the customer.
 * Note that this operation signs out a customer of any type authentication (via Synerise, External Provider, OAuth or Simple Authentication).
 *
 * @param mode Logout mode.
 * @param fromAllDevices Determines whether it should sign out all devices.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)signOutWithMode:(SNRClientSignOutMode)mode
         fromAllDevices:(BOOL)fromAllDevices
                success:(void (^)(void))success
                failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(signOut(mode:fromAllDevices:success:failure:));

/**
 * Refreshes the customer's token.
 */
+ (void)refreshTokenWithSuccess:(void (^)(void))success
                        failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(refreshToken(success:failure:));

/**
 * Retrieves the customer's token.
 * This method provides a valid token if the customer is signed in and the current token is not expired.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)retrieveTokenWithSuccess:(void (^)(SNRToken *token))success
                         failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(retrieveToken(success:failure:));

/**
 * Retrieves the customer's UUID.
 */
+ (NSString *)getUUID;

/**
 * Retrieves the current UUID or generates a new one from a seed (`authID`).
 * Note that this operation doesn't affect the customer session in the SDK.
 *
 * @param authID A seed for UUID generation.
 */
+ (NSString *)getUUIDForAuthenticationWithAuthID:(NSString *)authID NS_SWIFT_NAME(getUUIDForAuthentication(authID:));

/**
 * Regenerates the customer's UUID.
 * This operation clears authentication token, login (if applicable), custom email and custom identifier.
 * Note that this operation works only if the customer is anonymous.
 */
+ (BOOL)regenerateUUID;

/**
 * Regenerates the customer's UUID from a seed (`clientIdentifier`).
 * This operation clears authentication token, login (if applicable), custom email and custom identifier.
 * Note that this operation works only if the customer is anonymous.
 *
 * @param clientIdentifier A seed for UUID generation.
 */
+ (BOOL)regenerateUUIDWithClientIdentifier:(nullable NSString *)clientIdentifier NS_SWIFT_NAME(regenerateUUID(clientIdentifier:));

/**
 * Destroys the whole session completely.
 */
+ (void)destroySession NS_SWIFT_NAME(destroySession());

/**
 * Gets a customer's account information.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getAccountWithSuccess:(void (^)(SNRClientAccountInformation *accountInformation))success
                      failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getAccount(success:failure:));

/**
 * Retrieves events for an authenticated client.
 *
 * @param apiQuery `SNRClientEventsApiQuery` object responsible for storing all query parameters.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getEventsWithApiQuery:(SNRClientEventsApiQuery *)apiQuery
                      success:(void (^)(NSArray<SNRClientEventData *> *events))success
                      failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getEvents(apiQuery:success:failure:));

/**
 * Updates a profile's account basic information.
 *
 * @param context `SNRClientUpdateAccountBasicInformationContext` object with account basic information to be modified. Fields that are not provided are not modified.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)updateAccountBasicInformation:(SNRClientUpdateAccountBasicInformationContext *)context
                              success:(void (^)(BOOL isSuccess))success
                              failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(updateAccountBasicInformation(context:success:failure:));

/**
 * Updates a customer's account information.
 *
 * @param context `SNRClientUpdateAccountContext` object with client's account information to be modified. Fields that are not provided are not modified.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)updateAccount:(SNRClientUpdateAccountContext *)context
              success:(void (^)(BOOL isSuccess))success
              failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(updateAccount(context:success:failure:));

/**
 * Requests a customer's password reset with email. The token is sent to the provided email address.
 *
 * @param context `SNRClientPasswordResetRequestContext` object with client's email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestPasswordReset:(SNRClientPasswordResetRequestContext *)context
                     success:(void (^)(BOOL isSuccess))success
                     failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(requestPasswordReset(context:success:failure:));

/**
 * Confirms a customer's password reset with a new password and token.
 *
 * @param context `SNRClientPasswordResetConfirmationContext` object with client's new password and token.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmResetPassword:(SNRClientPasswordResetConfirmationContext *)context
                     success:(void (^)(BOOL isSuccess))success
                     failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(confirmResetPassword(context:success:failure:));

/**
 * Changes a customer's password.
 *
 * @param password Client's new password.
 * @param oldPassword Client's old password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)changePassword:(NSString *)password
           oldPassword:(NSString *)oldPassword
               success:(void (^)(BOOL isSuccess))success
               failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(changePassword(password:oldPassword:success:failure:));

/**
 * Requests a customer's email change. A confirmation token is sent to the current email address.
 *
 * @param email Client's new email.
 * @param password Client's password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.7.1
 */
+ (void)requestEmailChange:(NSString *)email
                  password:(NSString *)password
                   success:(void (^)(BOOL isSuccess))success
                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(requestEmailChange(email:password:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.requestEmailChange(email:password:externalToken:customID:success:failure:)` instead.");

/**
 * Requests a customer's email change. A confirmation token is sent to the current email address.
 *
 * @param email Client's new email.
 * @param password Client's password (if Synerise account).
 * @param externalToken Client's token (if OAuth, Facebook, Apple etc.).
 * @param authID Authorization custom identity.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestEmailChange:(NSString *)email
                  password:(nullable NSString *)password
             externalToken:(nullable id)externalToken
                  authID:(nullable NSString *)authID
                   success:(void (^)(BOOL isSuccess))success
                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(requestEmailChange(email:password:externalToken:authID:success:failure:));

/**
 * Requests client's email change by Facebook.
 *
 * @param email Client's new email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.7.1
 */
+ (void)requestEmailChangeByFacebook:(NSString *)email
                             success:(void (^)(BOOL isSuccess))success
                             failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(requestEmailChangeByFacebook(email:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.requestEmailChange(email:password:externalToken:customID:success:failure:)` instead.");

/**
 * Confirms a customer's email change with a token.
 *
 * @param token Client's token provided by email.
 * @param newsletterAgreement Agreement for newsletter with email provided.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmEmailChange:(NSString *)token
        newsletterAgreement:(BOOL)newsletterAgreement
                   success:(void (^)(BOOL isSuccess))success
                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(confirmEmailChange(token:newsletterAgreement:success:failure:));

/**
 * Requests a customer's phone update. A confirmation code is sent to the current number.
 *
 * @param phone Client's phone number.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestPhoneUpdate:(NSString *)phone
                   success:(void (^)(BOOL isSuccess))success
                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(requestPhoneUpdate(phone:success:failure:));

/**
 * Confirms a customer's phone update with a code.
 *
 * @param phone Client's new phone number.
 * @param smsAgreement Agreement for SMS marketing for the new phone number.
 * @param confirmationCode Client's confirmation code received by phone.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmPhoneUpdate:(NSString *)phone
          confirmationCode:(NSString *)confirmationCode
              smsAgreement:(BOOL)smsAgreement
                   success:(void (^)(BOOL isSuccess))success
                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(confirmPhoneUpdate(phone:confirmationCode:smsAgreement:success:failure:));

/**
 * Deletes a customer's account information.
 *
 * @param password Client's password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.6.19
 */
+ (void)deleteAccount:(NSString *)password
              success:(void (^)(BOOL isSuccess))success
              failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(deleteAccount(password:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:)` instead.");

/**
 * Deletes a customer's account information.
 *
 * @param clientAuthFactor Client's token (if OAuth, Facebook, Apple etc.) or password (if Synerise account).
 * @param clientIdentityProvider Client's identity provider.
 * @param authID Authorization custom identity.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deleteAccount:(id)clientAuthFactor
clientIdentityProvider:(SNRClientIdentityProvider)clientIdentityProvider
               authID:(nullable NSString *)authID
              success:(void (^)(BOOL isSuccess))success
              failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:));

/**
 * Deletes a customer's account information by OAuth.
 *
 * @param accessToken Client's OAuth token.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.6.19
 */
+ (void)deleteAccountByOAuth:(NSString *)accessToken
                        success:(void (^)(BOOL isSuccess))success
                        failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(deleteAccountByOAuth(accessToken:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:)` instead.");

/**
 * Deletes a customer's account information by Facebook.
 *
 * @param facebookToken Client's Token from an active Facebook session.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.6.19
 */
+ (void)deleteAccountByFacebook:(NSString *)facebookToken
                        success:(void (^)(BOOL isSuccess))success
                        failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(deleteAccountByFacebook(facebookToken:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:)` instead.");

/**
 * Deletes a customer's account information by Sign In With Apple.
 *
 * @param identityToken Client's Token from Facebook active session.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.6.19
 */
+ (void)deleteAccountByAppleSignIn:(NSData *)identityToken
                           success:(void (^)(BOOL isSuccess))success
                           failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(deleteAccountByAppleSignIn(identityToken:success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.deleteAccount(clientAuthFactor:clientIdentityProvider:authID:success:failure:)` instead.");

/**
 * Recognize anonymous users and save personal information from their CRM entries.
 *
 * @param email Client's email.
 * @param customIdentify Client's custom identifier.
 * @param parameters Client's custom parameters.
 */
+ (void)recognizeAnonymousWithEmail:(nullable NSString *)email
                     customIdentify:(nullable NSString *)customIdentify
                         parameters:(nullable NSDictionary *)parameters NS_SWIFT_NAME(recognizeAnonymous(email:customIdentify:parameters:));

/**
 * Registers user for Push Notifications.
 *
 * @param registrationToken Firebase FCM Token returned after successful push notifications registration from Firebase.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)registerForPush:(NSString *)registrationToken
                success:(void (^)(BOOL isSuccess))success
                failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(registerForPush(registrationToken:success:failure:));

/**
 * Registers user for Push Notifications.
 *
 * @param registrationToken Firebase FCM Token returned after successful push notifications registration from Firebase.
 * @param mobilePushAgreement Agreement (consent) for mobile push campaigns.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)registerForPush:(NSString *)registrationToken
    mobilePushAgreement:(BOOL)mobilePushAgreement
                success:(void (^)(BOOL isSuccess))success
                failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(registerForPush(registrationToken:mobilePushAgreement:success:failure:));

@end

NS_ASSUME_NONNULL_END








