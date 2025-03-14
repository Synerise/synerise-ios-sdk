//
//  GetDocumentTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class GetDocumentTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var slugTextField: UITextField!
    
    @IBOutlet weak var schemaTextField: UITextField!
    @IBOutlet weak var versionTextField: UITextField!
    
    // MARK: IBAction
    
    @IBAction func getDocumentBySlugButtonTapped(_ sender: DefaultButton) {
        guard let slug = slugTextField.text, !slug.isEmpty else {
            return
        }
        
        Content.generateDocument(slug: slug, success: { document in
            self.pushDebugViewController(text: (document.content as AnyObject).description)
        }) { error in
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "VIEW_CONTROLLER_GET_DOCUMENT_TITLE".localized()
        
        prepareBackButton()
    }
}
