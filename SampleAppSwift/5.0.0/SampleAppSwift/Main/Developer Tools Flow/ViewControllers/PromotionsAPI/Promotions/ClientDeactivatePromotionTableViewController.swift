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
    
    @IBOutlet weak var uuidTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func deactivatePromotioByUUID() {
        let uuid = self.uuidTextField.text ?? ""
        
        self.showLoading()
        Promotions.deactivatePromotion(uuid: uuid, success: {
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func deactivatePromotioByCode() {
        let code = self.codeTextField.text ?? ""
        
        self.showLoading()
        Promotions.deactivatePromotion(code: code, success: {
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
        
        self.navigationItem.title = "Deactivate Promotion"
    }
}
