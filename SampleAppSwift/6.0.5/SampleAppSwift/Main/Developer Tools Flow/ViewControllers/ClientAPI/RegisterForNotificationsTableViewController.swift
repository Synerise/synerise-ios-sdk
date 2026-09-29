//
//  RegisterForNotificationsTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2023 Synerise. All rights reserved.
//

import UIKit
import Firebase
import SyneriseSDK

class RegisterForNotificationsTableViewController: DefaultTableViewController {
  @IBOutlet var mobilePushAgreementSwitch: UISwitch!

  // MARK: - IBAction

  @IBAction func registerForNotificationsButtonWasPressed(_ sender: DefaultButton) {
    Messaging.messaging().token { [weak self] token, error in
      guard let fcmToken = token, !fcmToken.isEmpty else {
        return
      }
      
      let mobilePushAgreement = true // true or false, should depend on device permissions and customer's agreement in the application
      Client.registerForPush(registrationToken:fcmToken, mobilePushAgreement:mobilePushAgreement, success: { (success) in
        self.hideLoading()
        self.showSuccessInfo()
      } failure: { error in
        self.showErrorInfo(error as NSError)
        self.hideLoading()
      }
    }
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "Register For Notifications"
  }
}
