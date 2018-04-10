//
//  SNRHitTimerEvent.h
//  SyneriseSDK
//
//  Created on 10/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "SNREvent.h"

/**
 Represents a 'client hit timer' event.

 @note This could be used for profiling or activity time monitoring - you can send @c SNRHitTimerEvent when your client starts doing something and send it once again when he finishes, but this time with different time signature. Then you can use our analytics engine to measure e.g. average activity time.
 */
@interface SNRHitTimerEvent : SNREvent

@end