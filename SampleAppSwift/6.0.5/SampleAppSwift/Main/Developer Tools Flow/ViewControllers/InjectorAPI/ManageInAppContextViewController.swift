//
//  ManageInAppContextViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ManageInAppContextViewController: DefaultViewController {
  var onNotifyInAppContextChangeButton: (() -> Void)?

  @IBOutlet var contextTextView: UITextView!
  @IBOutlet var keyTextField: UITextField!
  @IBOutlet var valueTextField: UITextField!

  // MARK: - IBAction

  @IBAction func getInAppContext() {
    updateInAppContextTextView()
  }

  @IBAction func notifyInAppContextChange() {
    if let onNotifyInAppContextChangeButton = self.onNotifyInAppContextChangeButton {
      onNotifyInAppContextChangeButton()
    } else {
      Injector.notifyInAppContextChange()
    }
  }

  @IBAction func resetInAppContext() {
    Injector.inAppContext = [:]
    updateInAppContextTextView()
  }

  @IBAction func addToInAppContext() {
    guard let key = self.keyTextField.text, key.isEmpty == false else {
      return
    }

    let rawValue = self.valueTextField.text ?? ""
    let value: Any
    if let boolValue = Bool(rawValue.lowercased()) {
      value = boolValue
    } else if let intValue = Int(rawValue) {
      value = intValue
    } else if let doubleValue = Double(rawValue) {
      value = doubleValue
    } else {
      value = rawValue as String
    }

    Injector.inAppContext[key] = value
    updateInAppContextTextView()
    self.keyTextField.text = ""
    self.valueTextField.text = ""
  }

  @IBAction func sendInAppContextTestEvent() {
    Tracker.send(CustomEvent(label: "In-app message context test event", action: "inapp.context.test"))
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "Manage In-App Context"

    self.keyTextField.delegate = self
    self.valueTextField.delegate = self

    prepareBackButton()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    updateInAppContextTextView()
  }

  // MARK: - Private

  private func updateInAppContextTextView() {
    let context = Injector.inAppContext
    guard
      let data = try? JSONSerialization.data(withJSONObject: context, options: [.prettyPrinted]),
      let JSONString = String(data: data, encoding: .utf8)
    else {
      self.contextTextView.text = ""
      return
    }

    self.contextTextView.text = JSONString
  }
}

// MARK: - UITextFieldDelegate

extension ManageInAppContextViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
