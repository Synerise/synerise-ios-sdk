//
//  InAppMessageViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2022 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class InAppMessageViewController: DefaultViewController {

  @IBOutlet weak var includeSafeAreaSwitch: UISwitch!

  // MARK: - IBAction
    
  @IBAction func showBasicInAppMessageFulscreen() {
    let includeSafeArea = includeSafeAreaSwitch.isOn
    let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicFullscreen(includeSafeArea: includeSafeArea)
      let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
      if Synerise.responds(to: selector) {
        Synerise.perform(selector, with: inAppMessageDictionary)
      } else {
          self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
      }
  }

  @IBAction func showBasicInAppMessageModal() {
    let includeSafeArea = includeSafeAreaSwitch.isOn
      let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicModal(includeSafeArea: includeSafeArea)
      let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
      if Synerise.responds(to: selector) {
        Synerise.perform(selector, with: inAppMessageDictionary)
      } else {
          self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
      }
  }

  @IBAction func showBasicInAppMessageTopBar() {
    let includeSafeArea = includeSafeAreaSwitch.isOn
      let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicTopBar(includeSafeArea: includeSafeArea)
      let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
      if Synerise.responds(to: selector) {
        Synerise.perform(selector, with: inAppMessageDictionary)
      } else {
          self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
      }
  }

  @IBAction func showBasicInAppMessageBottomBar() {
    let includeSafeArea = includeSafeAreaSwitch.isOn
      let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicBottomBar(includeSafeArea: includeSafeArea)
      let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
      if Synerise.responds(to: selector) {
        Synerise.perform(selector, with: inAppMessageDictionary)
      } else {
          self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
      }
  }

  @IBAction func showDebugInAppMessage() {
    let includeSafeArea = includeSafeAreaSwitch.isOn
    let inAppMessageDictionary = InAppMessagesDictionaryData.getDebugFullScreen(includeSafeArea: includeSafeArea)
      let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
      if Synerise.responds(to: selector) {
        Synerise.perform(selector, with: inAppMessageDictionary)
      } else {
          self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
      }
  }

  @IBAction func showStorageDebugInAppMessage() {
    let includeSafeArea = includeSafeAreaSwitch.isOn
    let inAppMessageDictionary = InAppMessagesDictionaryData.getStorageDebugFullScreen(includeSafeArea: includeSafeArea)
      let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
      if Synerise.responds(to: selector) {
        Synerise.perform(selector, with: inAppMessageDictionary)
      } else {
          self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
      }
  }

  @IBAction func showInternalMethodDebugInAppMessage() {
    let includeSafeArea = includeSafeAreaSwitch.isOn
    let inAppMessageDictionary = InAppMessagesDictionaryData.getInternalMethodDebugFullScreen(includeSafeArea: includeSafeArea)
      let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
      if Synerise.responds(to: selector) {
        Synerise.perform(selector, with: inAppMessageDictionary)
      } else {
          self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
      }
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
      super.viewDidLoad()

      self.navigationItem.title = "In-App messages"

      prepareBackButton()
  }
}
