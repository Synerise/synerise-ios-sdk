//
//  ClientGetPromotionTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientGetPromotionTableViewController: DefaultTableViewController {
  @IBOutlet weak var uuidTextField: UITextField!
  @IBOutlet weak var codeTextField: UITextField!

  // MARK: - IBAction / Actions
  
  @IBAction func getPromotioByUuid() {
    guard let uuid = self.uuidTextField.text, uuid.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`UUID` is required")
      return
    }

    self.showLoading()
    Promotions.getPromotion(uuid: uuid, success: { promotion in
      let debugInfoString = SyneriseModelStringRepresentation.makePromotionStringRepresentation(promotion)
      self.hideLoading()
      self.pushDebugViewController(text: debugInfoString)
    }, failure: { (error) in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  @IBAction func getPromotioByCode() {
    guard let code = self.codeTextField.text, code.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`code` is required")
      return
    }

    self.showLoading()
    Promotions.getPromotion(code: code, success: { promotion in
      let debugInfoString = SyneriseModelStringRepresentation.makePromotionStringRepresentation(promotion)
      self.hideLoading()
      self.pushDebugViewController(text: debugInfoString)
    }, failure: { (error) in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "\("VIEW_CONTROLLER_PROMOTIONS_API_TITLE".localized()) / Get Promotion"
  }
}
