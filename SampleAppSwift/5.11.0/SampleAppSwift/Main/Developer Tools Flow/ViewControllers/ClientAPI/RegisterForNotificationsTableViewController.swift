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

    @IBOutlet weak var mobilePushAgreementSwitch: UISwitch!
    
    // MARK: - IBAction
    
    @IBAction func registerForNotificationsButtonWasPressed(_ sender: DefaultButton) {
        guard let token = Messaging.messaging().fcmToken else { return }
        
        showLoading()
        Client.registerForPush(registrationToken: token, mobilePushAgreement: mobilePushAgreementSwitch.isOn) {
            self.hideLoading()
            self.showSuccessInfo()
        } failure: { error in
            self.showErrorInfo(error as NSError)
            self.hideLoading()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Register For Notifications"
    }

}
