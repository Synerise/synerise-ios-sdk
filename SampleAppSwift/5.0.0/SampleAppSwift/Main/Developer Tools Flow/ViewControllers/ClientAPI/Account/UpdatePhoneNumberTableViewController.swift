//
//  UpdatePhoneNumberTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class UpdatePhoneNumberTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func updatePhoneNumber() {
        let phoneNumber = self.phoneNumberTextField.text ?? ""
        
        Client.requestPhoneUpdate(phone: phoneNumber, success: {
            self.showSuccessInfo()
        }, failure: { (error) in
            self.showErrorInfo(error as NSError)
        })
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Update Phone Number"
    }
}
