//
//  ClientAuthorizationViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientAuthorizationViewController: DefaultViewController {
    
    // MARK: - IBAction
    
    @IBAction func authorizeWithTokenPayloadMethodButtonWasPressed(_ sender: DefaultButton) {
        Client.signIn(email: "", password: "") {
            Client.retrieveToken { token in
                let uuid = Client.getUUIDForAuthentication(authID: "")
                let clientId = token.clientId ?? ""
                let tokenPayload = TokenPayload(tokenString: token.tokenString, expirationDate: token.expirationDate, creationDate: token.expirationDate, rlm: token.rlm, origin: token.origin, uuid: nil, clientId: clientId, customId: token.customId)
                Client.authenticate(tokenPayload: tokenPayload, authID: "") {
                    
                } failure: { error in
                    self.showErrorInfo(error as NSError)
                }
            } failure: { error in
                self.showErrorInfo(error as NSError)
            }
        } failure: { error in
            self.showErrorInfo(error as NSError)
        }

    }
    
    @IBAction func isSignedInButtonWasPressed(_ sender: DefaultButton) {
        let isSignedIn = Client.isSignedIn()
        
        if isSignedIn == true {
            presentAlert(title: "", message: "Client is signed in!")
        } else {
            presentAlert(title: "", message: "Client is not signed!")
        }
    }
    
    @IBAction func isSignedInViaSimpleAuthenticationButtonWasPressed(_ sender: DefaultButton) {
        let isSignedInViaSimpleAuthentication = Client.isSignedInViaSimpleAuthentication()
        
        if isSignedInViaSimpleAuthentication == true {
            presentAlert(title: "", message: "Client is signed in via Simple Authentication!")
        } else {
            presentAlert(title: "", message: "Client is not signed in via Simple Authentication!")
        }
    }
    
    @IBAction func signOutButtonWasPressed(_ sender: DefaultButton) {
        Client.signOut()
    }
    
    @IBAction func signOutModeLogoutButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.signOut(mode: .signOut, fromAllDevices: true) {
            self.hideLoading()
        } failure: { error in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
    
    @IBAction func signOutModeLogoutWithSessionDestroyButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.signOut(mode: .signOutWithSessionDestroy, fromAllDevices: true) {
            self.hideLoading()
        } failure: { error in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Authorization"
    }
}
