//
//  RegisterClientByEmailTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class RegisterClientByEmailTableViewController: DefaultTableViewController {
  @IBOutlet var clientContextEmailTextField: UITextField!
  @IBOutlet var clientContextPasswordTextField: UITextField!
  @IBOutlet var clientContextFirstNameTextField: UITextField!
  @IBOutlet var clientContextLastNameTextField: UITextField!
  @IBOutlet var clientContextCustomIDTextField: UITextField!
  @IBOutlet var clientContextCityNameTextField: UITextField!

  // MARK: - IBAction

  @IBAction func registerClientButtonWasPressed(_ sender: DefaultButton) {
    registerClient()
    sender.animateTapping()
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "Register Client By Email"
    clientContextEmailTextField.text = "registerClient@toreforge.com"
  }

  // MARK: - Private

  private func registerClient() {
    guard let registerClientContext = makeRegisterClientContext() else { return }

    showLoading()
    Client.registerAccount(context: registerClientContext, success: {
      self.hideLoading()
      self.showSuccessInfo()
    }, failure: { error in
      self.showErrorInfo(error as NSError)
      self.hideLoading()
    })
  }

  private func makeRegisterClientContext() -> ClientRegisterAccountContext? {
    guard let email = clientContextEmailTextField.text, email != "" else {
      let emailRow = IndexPath(row: 0, section: 0)

      self.tableView.scrollToRow(at: emailRow, at: .middle, animated: true)
      self.clientContextEmailTextField.becomeFirstResponder()

      return nil
    }

    guard let password = clientContextPasswordTextField.text, password != "" else {
      let passwordRow = IndexPath(row: 0, section: 1)

      self.tableView.scrollToRow(at: passwordRow, at: .middle, animated: true)
      self.clientContextPasswordTextField.becomeFirstResponder()

      return nil
    }

    let context = ClientRegisterAccountContext(email: email, password: password)

    context.firstName = clientContextFirstNameTextField.text
    context.lastName = clientContextLastNameTextField.text
    context.customId = clientContextCustomIDTextField.text
    context.city = clientContextCityNameTextField.text

    return context
  }
}
