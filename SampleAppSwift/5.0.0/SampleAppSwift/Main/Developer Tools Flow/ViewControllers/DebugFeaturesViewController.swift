//
//  DebugFeaturesViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2024 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

protocol DebugFeaturesViewControllerDelegate: class {
    func resetApplicationWasPressed(_ developerMenuViewController: DebugFeaturesViewController)
}

class DebugFeaturesViewController: DefaultViewController {
    
    weak var delegate: DebugFeaturesViewControllerDelegate?
    
    @IBOutlet weak var debugMenuStackView: UIStackView!
    
    var onCloseButton: (() -> Void)?
    
    // MARK: - IBAction
    
    @IBAction func getSDKLog() {
        if isDebugFeatureAvailable() == false {
            presentOnlyDebugFeatureAlert()
        }
        
        let selector = NSSelectorFromString("getFileLog")
        if Synerise.responds(to: selector) {
            let unmanaged = Synerise.perform(selector)
            let dataDebugDescription = unmanaged?.takeUnretainedValue() as? String
            self.pushDebugViewController(text: dataDebugDescription!)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func clearSDKLog() {
        if isDebugFeatureAvailable() == false {
            presentOnlyDebugFeatureAlert()
        }
        
        let selector = NSSelectorFromString("clearFileLog")
        if Synerise.responds(to: selector) {
            Synerise.perform(selector)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func showDataDebugDescription() {
        if isDebugFeatureAvailable() == false {
            presentOnlyDebugFeatureAlert()
        }
        
        let selector = NSSelectorFromString("getDataDebugDescription")
        if Synerise.responds(to: selector) {
            let unmanaged = Synerise.perform(selector)
            let dataDebugDescription = unmanaged?.takeUnretainedValue() as? String
            self.pushDebugViewController(text: dataDebugDescription!)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func showInAppDebugDescription() {
        if isDebugFeatureAvailable() == false {
            presentOnlyDebugFeatureAlert()
        }
        
        let selector = NSSelectorFromString("getInAppDebugDescription")
        if Synerise.responds(to: selector) {
            let unmanaged = Synerise.perform(selector)
            let dataDebugDescription = unmanaged?.takeUnretainedValue() as? String
            self.pushDebugViewController(text: dataDebugDescription!)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func removeAllData() {
        if isDebugFeatureAvailable() == false {
            presentOnlyDebugFeatureAlert()
        }
        
        executeRemoveAllPersistentAndTemporarySyneriseData()
        throwExceptionAfterUsingDebugFeatures()
    }
    
    @IBAction func reloadInAppDefinitions() {
        if isDebugFeatureAvailable() == false {
            presentOnlyDebugFeatureAlert()
        }
        
        executeReloadInAppDefinitions()
    }
    
    @IBAction func removeAllnAppData() {
        if isDebugFeatureAvailable() == false {
            presentOnlyDebugFeatureAlert()
        }
        
        executeRemoveAllSyneriseInAppData()
        throwExceptionAfterUsingDebugFeatures()
    }
    
    @IBAction func removeAllSyneriseAuthTokensData() {
        if isDebugFeatureAvailable() == false {
            presentOnlyDebugFeatureAlert()
        }
        
        executeRemoveAllSyneriseAuthTokensData()
        throwExceptionAfterUsingDebugFeatures()
    }
    
    @IBAction func fullResetSDKAndApplication() {
        if isDebugFeatureAvailable() == false {
            presentOnlyDebugFeatureAlert()
        }
        
        executeRemoveAllPersistentAndTemporarySyneriseData()
        executeRemoveAllSyneriseInAppData()
        
        let secItemClasses = [kSecClassGenericPassword, kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for itemClass in secItemClasses {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
        }
        
         delegate?.resetApplicationWasPressed(self)
    }
    
    // MARK: - Inherited
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_DEBUG_FEATURES_MENU_TITLE".localized()
        
        prepareCloseRightMenuButton()
        prepareBackButton()
    }
    
    // MARK: - Private
    
    func prepareCloseRightMenuButton() {
        let buttonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_close_black"), style: .plain, target: self, action: #selector(self.closeButtonWasPressed))
        buttonItem.tintColor = UIColor.black
        
        self.navigationItem.rightBarButtonItem = buttonItem
    }
    
    @objc private func closeButtonWasPressed() {
        onCloseButton?()
    }
    
    private func presentOnlyDebugFeatureAlert() {
        self.presentAlert(title: "Only DEBUG mode feature!", message: "This feature is available in DEBUG mode only.")
    }
    
    private func throwExceptionAfterUsingDebugFeatures () {
        NSException(name: NSExceptionName.genericException, reason: "Restart after using debug features.", userInfo: nil).raise()
    }
    
    private func isDebugFeatureAvailable() -> Bool {
        let selector = NSSelectorFromString("isDebugFeatureAvailable")
        if Synerise.responds(to: selector) {
            return true
        }
        
        return false
    }
    
    private func executeRemoveAllPersistentAndTemporarySyneriseData() {
        let selector = NSSelectorFromString("clearAllPersistentAndTemporaryData")
        if Synerise.responds(to: selector) {
            _ = Synerise.perform(selector)
        }
    }
    
    private func executeReloadInAppDefinitions() {
        let selector = NSSelectorFromString("reloadInAppDefinitions")
        if Synerise.responds(to: selector) {
            _ = Synerise.perform(selector)
        }
    }
    
    private func executeRemoveAllSyneriseInAppData() {
        let selector = NSSelectorFromString("clearAllInAppData")
        if Synerise.responds(to: selector) {
            _ = Synerise.perform(selector)
        }
    }
    
    private func executeRemoveAllSyneriseAuthTokensData() {
        let selector = NSSelectorFromString("clearAuthTokensData")
        if Synerise.responds(to: selector) {
            _ = Synerise.perform(selector)
        }
    }
}
