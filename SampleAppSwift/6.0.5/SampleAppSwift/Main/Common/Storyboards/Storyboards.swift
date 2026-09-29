//
//  Storyboards.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit

enum Storyboards {
  private static let developerToolsFlow: String = "DeveloperToolsFlow"
  private static let debugFeatures: String = "DebugFeatures"
  private static let inAppMessagesLiveOptions: String = "InAppMessageLiveOptions"

  static func getDeveloperToolsFlow() -> UIStoryboard {
    return UIStoryboard(name: developerToolsFlow, bundle: Bundle.main)
  }

  static func getDebugFeatures() -> UIStoryboard {
    return UIStoryboard(name: debugFeatures, bundle: Bundle.main)
  }

  static func getInAppMessagesLiveOptions() -> UIStoryboard {
    return UIStoryboard(name: inAppMessagesLiveOptions, bundle: Bundle.main)
  }
}
