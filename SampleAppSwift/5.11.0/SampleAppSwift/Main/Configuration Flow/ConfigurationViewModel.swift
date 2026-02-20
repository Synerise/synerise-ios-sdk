//
//  ConfigurationViewModel.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class ConfigurationViewModel {
    
    var coordinator: ConfigurationCoordinator?
    
    var syneriseBaseURL: BindingType<String>
    var clientAPIKey: BindingType<String>
    
    var onFinishButton: (() -> Void)?
    
    // MARK: - Init
    
    init() {
        self.clientAPIKey = BindingType<String>.init("")
        self.syneriseBaseURL = BindingType<String>.init("")
    }
    
    init(clientAPIKey: String) {
        self.clientAPIKey = BindingType<String>.init(clientAPIKey)
        self.syneriseBaseURL = BindingType<String>.init("")
    }
    
    // MARK: - Public
    
    func isFormValid() -> Bool {
        if let clientAPIKey = clientAPIKey.value, !clientAPIKey.isEmpty, let syneriseBaseURL = syneriseBaseURL.value, !syneriseBaseURL.isEmpty {
           return true
        }
        
        return false
    }
    
    func saveDefaultSettings() {
        let settingsService = coordinator?.applicationController.serviceProvider.getSettingsService()
        
        settingsService?.set(true, forKey: .sdkEnabledKey)
        settingsService?.set(true, forKey: .notificationsEnabledKey)
        settingsService?.set(false, forKey: .notificationsDisableInAppAlertsKey)
        settingsService?.set(false, forKey: .notificationsEncryptionKey)
        settingsService?.set(true, forKey: .autoTrackingEnabledKey)
        settingsService?.set(true, forKey: .trackingEnabledKey)
    }
    
    func saveSyneriseBaseUrlAndAPIKey() {
        let settingsService = coordinator?.applicationController.serviceProvider.getSettingsService()
        
        settingsService?.set(syneriseBaseURL.value, forKey: SettingsServiceKey.syneriseBaseUrlKey)
        settingsService?.set(clientAPIKey.value, forKey: SettingsServiceKey.syneriseClientAPIKey)
    }
}
