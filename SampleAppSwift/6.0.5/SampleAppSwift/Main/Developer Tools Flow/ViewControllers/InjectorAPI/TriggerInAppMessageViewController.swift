//
//  TriggerInAppMessageViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class TriggerInAppMessageViewController: DefaultViewController {
  private enum ParamType: Int {
    case string
    case number
    case bool
  }

  var onSendEventButton: (() -> Void)?

  @IBOutlet private var eventActionTextField: UITextField!
  @IBOutlet private var paramsTextView: UITextView!
  @IBOutlet private var paramTypeSegmentedControl: UISegmentedControl!
  @IBOutlet private var keyTextField: UITextField!
  @IBOutlet private var valueTextField: UITextField!

  private var inAppMessagesLiveOptionsViewController: InAppMessagesLiveOptionsViewController?
  private var inAppMessagesLiveOptionsViewControllerDelegate: InAppMessagesLiveOptionsViewControllerDelegate?
  private var inAppMessageLiveOptionsWindow: UIWindow?

  private var inlineInAppLogs: [String] = []

  private var eventParams: [String: Any] = [:]

  // MARK: - IBAction

  @IBAction private func paramTypeChanged(_ sender: UISegmentedControl) {
    clearParamInputs()
  }

  @IBAction private func addParamButtonWasPressed(_ sender: DefaultButton) {
    addParamToEvent()
  }

  @IBAction private func sendEventButtonWasPressed(_ sender: DefaultButton) {
    if let onSendEventButton = self.onSendEventButton {
      sendEvent()
      onSendEventButton()
    } else {
      sendEvent()
    }
  }

  // MARK: - Inherited

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "Trigger In-App Message"

    self.eventActionTextField.delegate = self
    self.keyTextField.delegate = self
    self.valueTextField.delegate = self

    prepareBackButton()
    updateParamsTextView()
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

  // MARK: - Event parameters

  private func clearParamInputs() {
    self.keyTextField.text = ""
    self.valueTextField.text = ""
  }

  private func updateParamsTextView() {
    guard
      let data = try? JSONSerialization.data(withJSONObject: self.eventParams, options: [.prettyPrinted]),
      let JSONString = String(data: data, encoding: .utf8)
    else {
      self.paramsTextView.text = ""
      return
    }

    self.paramsTextView.text = JSONString
  }

  private func addParamToEvent() {
    guard let key = getItem(textField: self.keyTextField) else { return }
    guard let value = getItem(textField: self.valueTextField) else { return }

    let type = ParamType(rawValue: self.paramTypeSegmentedControl.selectedSegmentIndex) ?? .string

    switch type {
    case .string:
      self.eventParams[key] = value

    case .number:
      if let intValue = Int(value) {
        self.eventParams[key] = intValue
      } else if let doubleValue = Double(value) {
        self.eventParams[key] = doubleValue
      } else {
        self.valueTextField.animateEmpty(withDuration: 0.2)
        return
      }

    case .bool:
      self.eventParams[key] = (value as NSString).boolValue
    }

    clearParamInputs()
    updateParamsTextView()
    UserInfoMessageManager.shared.success("Success", "Param `\(key)` was added")
  }

  private func sendEvent() {
    guard let action = getItem(textField: self.eventActionTextField) else { return }

    let params = TrackerParams.make { builder in
      for (key, value) in self.eventParams {
        builder.setObject(value, forKey: key)
      }
    }

    let event = CustomEvent(label: action, action: action, params: params)
    Tracker.send(event)

    self.eventParams.removeAll()
    self.eventActionTextField.text = ""
    clearParamInputs()
    updateParamsTextView()
    self.view.endEditing(true)
  }

  private func getItem(textField: UITextField) -> String? {
    guard let item = textField.text, item.isEmpty == false else {
      textField.animateEmpty(withDuration: 0.2)
      return nil
    }

    return item
  }
}

// MARK: - UITextFieldDelegate

extension TriggerInAppMessageViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}

// MARK: - InjectorInAppMessageDelegate

extension TriggerInAppMessageViewController: InjectorInAppMessageDelegate {
  func snr_shouldInAppMessageAppear(data: InAppMessageData) -> Bool {
    return true
  }

  func snr_inAppMessageDidAppear(data: InAppMessageData) {
    // nothing for yet
  }

  func snr_inAppMessageDidDisappear(data: InAppMessageData) {
    // nothing for yet
  }

  func snr_inAppMessageDidChangeSize(rect: CGRect) {
    // nothing for yet
  }

  func snr_inAppMessageContextIsNeeded(data: InAppMessageData) -> [AnyHashable: Any]? {
    return nil
  }

  func snr_inAppMessageHandledAction(data: InAppMessageData, url: URL) {
    // nothing for yet
  }

  func snr_inAppMessageHandledAction(data: InAppMessageData, deeplink: String) {
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
