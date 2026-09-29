//
//  SampleInAppMessagesViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2022 Synerise. All rights reserved.
//

import UIKit
import CoreMotion
import SyneriseSDK

class SampleInAppMessagesViewController: DefaultViewController {
  @IBOutlet var overlayOrInlineSegmentedControl: UISegmentedControl!
  @IBOutlet var includeSafeAreaSwitch: UISwitch!

  private var isInlineSelected: Bool {
    return self.overlayOrInlineSegmentedControl.selectedSegmentIndex == 1
  }

  private var includeSafeArea: Bool {
    return self.isInlineSelected ? false : self.includeSafeAreaSwitch.isOn
  }

  // MARK: - IBAction

  @IBAction func overlayOrInlineSegmentedControlChanged(_ sender: UISegmentedControl) {
    let isInline = sender.selectedSegmentIndex == 1
    self.includeSafeAreaSwitch.isEnabled = (isInline == false)
  }

  @IBAction func showBasicInAppMessageFulscreen() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicFullscreen(includeSafeArea: self.includeSafeArea)
    showInAppMessage(inAppMessageDictionary)
  }

  @IBAction func showBasicInAppMessageModal() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicModal(includeSafeArea: self.includeSafeArea)
    showInAppMessage(inAppMessageDictionary)
  }

  @IBAction func showBasicInAppMessageTopBar() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicTopBar(includeSafeArea: self.includeSafeArea)
    showInAppMessage(inAppMessageDictionary)
  }

  @IBAction func showBasicInAppMessageBottomBar() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicBottomBar(includeSafeArea: self.includeSafeArea)
    showInAppMessage(inAppMessageDictionary, bottomContentInsetEnabled: true)
  }

  @IBAction func showDebugInAppMessage() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getDebugFullScreen(includeSafeArea: self.includeSafeArea)
    showInAppMessage(inAppMessageDictionary)
  }

  @IBAction func showContextFromAppDebugInAppMessage() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getContextFromAppDebugBottomBar(includeSafeArea: self.includeSafeArea)
    showInAppMessage(inAppMessageDictionary, bottomContentInsetEnabled: true)
  }

  @IBAction func showHandleCustomMethodDebugInAppMessage() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getHandleCustomMethodDebugBottomBar(includeSafeArea: self.includeSafeArea)
    showInAppMessage(inAppMessageDictionary, bottomContentInsetEnabled: true)
  }

  @IBAction func showComponentSizingDebugInAppMessage() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getComponentSizingDebugBottomBar(includeSafeArea: self.includeSafeArea)
    showInAppMessage(inAppMessageDictionary, bottomContentInsetEnabled: true)
  }

  @IBAction func showStorageDebugInAppMessage() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getStorageDebugFullScreen(includeSafeArea: self.includeSafeArea)
    showInAppMessage(inAppMessageDictionary)
  }

  @IBAction func showInternalMethodDebugInAppMessage() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getInternalMethodDebugFullScreen(includeSafeArea: includeSafeArea)
    showInAppMessage(inAppMessageDictionary)
  }

  @IBAction func showVariousTestCreationInAppMessage() {
    let inAppMessageDictionary = InAppMessagesDictionaryData.getVariousTestCreation(includeSafeArea: includeSafeArea)
    showInAppMessage(inAppMessageDictionary)
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "Sample In-App messages"

    self.overlayOrInlineSegmentedControl.selectedSegmentIndex = 0
    self.includeSafeAreaSwitch.isEnabled = true

    prepareBackButton()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    Injector.setInAppMessageDelegate(self)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    let applicationController = ApplicationController.resolve()
    let syneriseManager = applicationController.syneriseManager!
    Injector.setInAppMessageDelegate(syneriseManager)
  }

  // MARK: - Private

  private func showInAppMessage(_ inAppMessageDictionary: [AnyHashable: Any], bottomContentInsetEnabled: Bool = false) {
    if self.isInlineSelected == true {
      pushSingleTriggeredInlineInAppViewController(inAppMessageDictionary: inAppMessageDictionary)
      return
    }

    let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
    if Synerise.responds(to: selector) {
      if bottomContentInsetEnabled {
        SyneriseManager.bottomContentInsetEnabled = true
      }
      Synerise.perform(selector, with: inAppMessageDictionary)
    } else {
      self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
    }
  }

  private func pushSingleTriggeredInlineInAppViewController(inAppMessageDictionary: [AnyHashable: Any]) {
    let viewController = SingleTriggeredInlineInAppMessageViewController(inAppMessageDictionary: inAppMessageDictionary)
    self.navigationController?.pushViewController(viewController, animated: true)
  }
}

extension SampleInAppMessagesViewController: InjectorInAppMessageDelegate {
  func snr_shouldInAppMessageAppear(data: InAppMessageData) -> Bool {
    return true
  }

  func snr_inAppMessageDidAppear(data: InAppMessageData) {
    // nothing for yet
  }

  func snr_inAppMessageDidDisappear(data: InAppMessageData) {
    SyneriseManager.bottomContentInsetEnabled = false
    SyneriseManager.bottomContentInsetValue = 0
    refreshBottomContentInsetIfNeeded()
  }

  func snr_inAppMessageDidChangeSize(rect: CGRect) {
    if SyneriseManager.bottomContentInsetEnabled == true {
      SyneriseManager.bottomContentInsetValue = Float(rect.height)
      refreshBottomContentInsetIfNeeded()
    }
  }

  func snr_inAppMessageContextIsNeeded(data: InAppMessageData) -> [AnyHashable: Any]? {
    return nil
  }

  func snr_inAppMessageHandledAction(data: InAppMessageData, url: URL) {
    // nothing for yet
  }

  func snr_inAppMessageHandledAction(data: InAppMessageData, deepLink: String) {
    // nothing for yet
  }

  func snr_inAppMessageHandledCustomAction(data: InAppMessageData, name: String, parameters: [AnyHashable: Any]) {
    // nothing for yet
  }

  func snr_inAppMessageHandledCustomMethod(data: InAppMessageData, name: String, parameters: [AnyHashable: Any], completion: InAppCustomMethodCompletion) {
    SyneriseManager.snr_inAppMessageHandledCustomMethod(data: data, name: name, parameters: parameters, completion: completion)
  }
}
