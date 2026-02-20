//
//  ClientActivatePromotionTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

// swiftlint:disable:next type_name
class ClientActivatePromotionTableViewController: DefaultTableViewController {
  @IBOutlet weak var uuidTextField: UITextField!
  @IBOutlet weak var codeTextField: UITextField!
  @IBOutlet weak var uuidOrCodeSegmentedControl: UISegmentedControl!
  @IBOutlet weak var uuidOrCodeTextField: UITextField!
  @IBOutlet weak var pointsToUseTextField: UITextField!

  // MARK: - IBAction / Actions
  
  @IBAction func activatePromotionByUuid() {
    guard let uuid = self.uuidTextField.text, uuid.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`UUID` is required")
      return
    }

    self.showLoading()
    Promotions.activatePromotion(uuid: uuid, success: {
      self.hideLoading()
      self.showSuccessInfo()
    }, failure: { (error) in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  @IBAction func activatePromotionByCode() {
    guard let code = self.codeTextField.text, code.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`code` is required")
      return
    }

    self.showLoading()
    Promotions.activatePromotion(code: code, success: {
      self.hideLoading()
      self.showSuccessInfo()
    }, failure: { (error) in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  @IBAction func activatePromotion() {
    if self.uuidOrCodeSegmentedControl.selectedSegmentIndex == 0 {
      self.activatePromotionWithOptionsByUuid()
    } else {
      self.activatePromotionWithOptionsByCode()
    }
  }

  private func activatePromotionWithOptionsByUuid() {
    guard let uuid = self.uuidOrCodeTextField.text, uuid.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`UUID` is required")
      return
    }

    let identifier = PromotionIdentifier(uuid: uuid)
    let options = PromotionActivationOptions(identifier: identifier)

    if let pointsToUse = self.pointsToUseTextField.text, pointsToUse.isEmpty == false, let pointsToUseValue = Int(pointsToUse) {
      options.pointsToUse = pointsToUseValue
    }

    self.showLoading()
    Promotions.activatePromotion(options: options, success: { promotion in
      let debugInfoString = SyneriseModelStringRepresentation.makePromotionStringRepresentation(promotion)
      self.hideLoading()
      self.pushDebugViewController(text: debugInfoString)
    }, failure: { (error) in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  private func activatePromotionWithOptionsByCode() {
    guard let code = self.uuidOrCodeTextField.text, code.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`code` is required")
      return
    }

    let identifier = PromotionIdentifier(code: code)
    let options = PromotionActivationOptions(identifier: identifier)

    if let pointsToUse = self.pointsToUseTextField.text, pointsToUse.isEmpty == false, let pointsToUseValue = Int(pointsToUse) {
      options.pointsToUse = pointsToUseValue
    }

    self.showLoading()
    Promotions.activatePromotion(options: options, success: { promotion in
      let debugInfoString = SyneriseModelStringRepresentation.makePromotionStringRepresentation(promotion)
      self.hideLoading()
      self.pushDebugViewController(text: debugInfoString)
    }, failure: { (error) in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  @objc private func uuidOrCodeSegmentedControlValueChanged(_ sender: UISegmentedControl) {
    updateUuidOrCodeTextField()
  }

  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "\("VIEW_CONTROLLER_PROMOTIONS_API_TITLE".localized()) / Activate Promotion"

    setup()
    setDefaultSettingsForControls()
  }

  // MARK: - Private

  private func setup() {
    self.uuidOrCodeSegmentedControl.addTarget(self, action: #selector(uuidOrCodeSegmentedControlValueChanged(_:)), for: .valueChanged)
  }

  private func setDefaultSettingsForControls() {
    self.uuidOrCodeSegmentedControl.selectedSegmentIndex = 0

    updateUuidOrCodeTextField()
  }

  private func updateUuidOrCodeTextField() {
    if self.uuidOrCodeSegmentedControl.selectedSegmentIndex == 0 {
      self.uuidOrCodeTextField.placeholder = "UUID"
    } else {
      self.uuidOrCodeTextField.placeholder = "Code"
    }
  }
}
