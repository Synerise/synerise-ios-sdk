//
//  LeftMenuViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit
import SyneriseSDK

class LeftMenuItemViewModel {

    let identity: Int
    let iconImageView: UIImageView
    let title: String

    // MARK: - Init

    init(_ model: LeftMenuItem) {
        self.identity = model.identity
        self.iconImageView = UIImageView(image: model.icon)
        self.title = model.title
    }
}

class LeftMenuViewModel {

    var coordinator: MainCoordinator?
    
    var settingsService: SettingsService!
    
    var state: LeftMenuState = LeftMenuState.userNotLogged {
        didSet {
            self.updateNeeded = true
        }
    }
    
    var updateNeeded: Bool = false {
        didSet {
            if updateNeeded == true {
                update()
            }
            
            updateNeeded = false
        }
    }
    var onUpdate: (() -> Void)?
    
    var profileInfoViewModel: ProfileInfoViewModel = {
        let profileInfoViewModel = ProfileInfoViewModel()
        
        return profileInfoViewModel
    }()
    
    var isSDKDebugFeaturesModeEnabled: Bool {
        let selector = NSSelectorFromString("isDebugFeatureAvailable")
        if Synerise.responds(to: selector) {
            return true
        }
        
        return false
    }
    
    var SDKDebugFeaturesModeTitle: String {
        let selector = NSSelectorFromString("isDebugFeatureAvailable")
        if Synerise.responds(to: selector) {
            return "DEBUG | SDK FEATURES MENU: enabled"
        }

        return "RELEASE | SDK FEATURES MENU: disabled"
    }
    
    var syneriseSDKConfigurationInfoString: String {
        guard let clientApiKey: String = ServiceProvider.resolve().getSettingsService().get(SettingsServiceKey.syneriseClientAPIKey) else {
            fatalError()
        }
        
        let clientApiKeyProfile: String = Configuration.SyneriseSDK.clientApiKeyToProfileName[clientApiKey] ?? ""
        
        return """
        \(clientApiKeyProfile)
        \(clientApiKey)
        """
    }
    
    var applicationVersionString: String {
        guard let applicationVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return ""
        }
        
        guard let applicationBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            return ""
        }
        
        guard let sdkVersion = Bundle(identifier: "com.synerise.SyneriseSDK")?.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return ""
        }
        
        return """
        SyneriseSDK | Version: \(sdkVersion)
        Sample App | Version: \(applicationVersion) | Build: \(applicationBuild)
        """
    }

    private var leftMenuItemViewModels: [LeftMenuItemViewModel] = [LeftMenuItemViewModel]()
    
    // MARK: - Init

    init() {
        prepareLeftMenuItems()
    }

    // MARK: - Public

    func numberOfItems() -> Int {
        return leftMenuItemViewModels.count
    }

    func itemForIndex(_ index: Int) -> LeftMenuItemViewModel {
        return leftMenuItemViewModels[index]
    }

    func itemSelected(_ index: Int) {
        let selectedItemViewModel: LeftMenuItemViewModel = itemForIndex(index)

        if let selectedItemIdentity: LeftMenuItemIdentity = LeftMenuItemIdentity(rawValue: selectedItemViewModel.identity) {
            coordinator?.leftMenuItemDidSelect(selectedItemIdentity)
        }
    }
    
    func loginSelected() {
        coordinator?.leftMenuItemDidSelect(LeftMenuItemIdentity.login)
    }
    
    func showSDKDebugFeatures() {
        coordinator?.showDebugFeaturesMenu()
    }

    // MARK: - Private
    private func update() {
        prepareLeftMenuItems()
        
        onUpdate?()
    }
    
    private func prepareLeftMenuItems() {
        let leftMenuState: LeftMenuState = self.state
        let leftMenuItems: [LeftMenuItem] = LeftMenuDataSource.getLeftMenuItems(leftMenuState)

        self.leftMenuItemViewModels.removeAll()
        
        leftMenuItems.forEach { (item) in
            let itemViewModel = LeftMenuItemViewModel(item)
            self.leftMenuItemViewModels.append(itemViewModel)
        }
    }
}
