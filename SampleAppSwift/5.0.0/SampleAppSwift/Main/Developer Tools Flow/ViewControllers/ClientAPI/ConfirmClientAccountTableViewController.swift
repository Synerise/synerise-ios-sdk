//
//  ConfirmClientAccountTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ConfirmClientAccountTableViewController: DefaultTableViewController {

    @IBOutlet weak var tokenTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func confirmAccount() {
        let token = self.tokenTextField.text ?? ""
        
        showLoading()
        Client.confirmAccountActivation(token: token, success: {
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Confirm Account"
    }

}
