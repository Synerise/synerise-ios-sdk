//
//  ClientDeactivatePromotionTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientDeactivatePromotionTableViewController: DefaultTableViewController {
  @IBOutlet var uuidTextField: UITextField!
  @IBOutlet var codeTextField: UITextField!

  // MARK: - IBAction / Actions

  @IBAction func deactivatePromotionByUuid() {
    guard let uuid = self.uuidTextField.text, uuid.isEmpty == false else {
      return
    }

    self.showLoading()
    Promotions.deactivatePromotion(uuid: uuid, success: {
      self.hideLoading()
      self.showSuccessInfo()
    }, failure: { error in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  @IBAction func deactivatePromotionByCode() {
    guard let code = self.codeTextField.text, code.isEmpty == false else {
      return
    }

    self.showLoading()
    Promotions.deactivatePromotion(code: code, success: {
      self.hideLoading()
      self.showSuccessInfo()
    }, failure: { error in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "\("VIEW_CONTROLLER_PROMOTIONS_API_TITLE".localized()) / Deactivate Promotion"
  }
}
