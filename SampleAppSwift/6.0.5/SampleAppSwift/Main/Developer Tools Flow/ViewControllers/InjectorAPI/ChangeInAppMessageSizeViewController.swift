//
//  ChangeInAppMessageSizeViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ChangeInAppMessageSizeViewController: DefaultViewController {
  var onChangeComponentSizeButton: ((CGFloat, CGFloat) -> Void)?

  @IBOutlet var widthTextField: UITextField!
  @IBOutlet var heightTextField: UITextField!

  // MARK: - IBAction

  @IBAction func changeComponentSize() {
    guard
      let widthText = self.widthTextField.text,
      let width = Double(widthText),
      let heightText = self.heightTextField.text,
      let height = Double(heightText)
    else {
      return
    }

    if let onChangeComponentSizeButton = self.onChangeComponentSizeButton {
      onChangeComponentSizeButton(width, height)
    }
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "Change In-App component size"

    self.widthTextField.delegate = self
    self.heightTextField.delegate = self

    prepareBackButton()
  }
}

// MARK: - UITextFieldDelegate

extension ChangeInAppMessageSizeViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
