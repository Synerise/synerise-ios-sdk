//
//  ClientDeactivatePromotionsTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2021 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientDeactivatePromotionsTableViewController: DefaultTableViewController {
  @IBOutlet var uuidsTextField: UITextField!
  @IBOutlet var codesTextField: UITextField!

  // MARK: - IBAction / Actions

  @IBAction func deactivatePromotionsWithUuidIdentifiers() {
    guard let uuids = self.uuidsTextField.text, uuids.isEmpty == false else {
      self.presentAlert(title: "Error", message: "At least one `uuid` is required")
      return
    }

    let uuidsArray = uuids.components(separatedBy: ",").filter { !$0.isEmpty }
    if uuidsArray.isEmpty == true {
      return
    }

    var promotionIdentifiers = [PromotionIdentifier]()
    for uuid in uuidsArray {
      let promotionIdentifier = PromotionIdentifier(uuid: uuid)
      promotionIdentifiers.append(promotionIdentifier)
    }

    self.showLoading()
    Promotions.deactivatePromotions(identifiers: promotionIdentifiers, success: {
      self.hideLoading()
      self.showSuccessInfo()
    }, failure: { error in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  @IBAction func deactivatePromotionsWithCodeIdentifiers() {
    guard let codes = self.codesTextField.text, codes.isEmpty == false else {
      self.presentAlert(title: "Error", message: "At least one `code` is required")
      return
    }

    let codesArray = codes.components(separatedBy: ",").filter { !$0.isEmpty }
    if codesArray.isEmpty == true {
      return
    }

    var promotionIdentifiers = [PromotionIdentifier]()
    for code in codesArray {
      let promotionIdentifier = PromotionIdentifier(code: code)
      promotionIdentifiers.append(promotionIdentifier)
    }

    self.showLoading()
    Promotions.deactivatePromotions(identifiers: promotionIdentifiers, success: {
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
    self.navigationItem.title = "\("VIEW_CONTROLLER_PROMOTIONS_API_TITLE".localized()) / Deactivate Promotions"
  }
}
