//
//  UserRegistrationFormViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import SyneriseSDK

typealias UserRegistrationSuccess = (_ response: Any) -> Void
typealias UserRegistrationError = (_ error: Error) -> Void

class UserRegistrationFormViewModel {
  enum RegistrationType: Int {
    case email = 0
  }

  var isProcessing: ObservingType<Bool> = ObservingType(false)

  var registrationType: BindingType<Int>
  var firstName: BindingType<String>
  var lastName: BindingType<String>
  var login: BindingType<String>
  var password: BindingType<String>

  private var onSuccessClosures: [UserRegistrationSuccess] = .init()
  private var onErrorClosures: [UserRegistrationError] = .init()

  // MARK: - Init

  init() {
    self.registrationType = BindingType<Int>(RegistrationType.email.rawValue)
    self.firstName = BindingType<String>("")
    self.lastName = BindingType<String>("")
    self.login = BindingType<String>("")
    self.password = BindingType<String>("")
  }

  init(firstName: String, lastName: String, login: String, password: String, registrationType: RegistrationType) {
    self.registrationType = BindingType<Int>(registrationType.rawValue)
    self.firstName = BindingType<String>(firstName)
    self.lastName = BindingType<String>(lastName)
    self.login = BindingType<String>(login)
    self.password = BindingType<String>(password)
  }

  // MARK: - Public

  func invokeOnSuccess(_ closure: @escaping UserRegistrationSuccess) {
    onSuccessClosures.append(closure)
  }

  func invokeOnError(_ closure: @escaping UserRegistrationError) {
    onErrorClosures.append(closure)
  }

  func isValid() -> Bool {
    return validate()
  }

  // MARK: - Private

  private func validate() -> Bool {
    return true
  }

  private func executeRegister() {
    isProcessing(true)

    guard isValid() else {
      return
    }

    do {
      if let registerClientContext = try self.makeRegisterClientContext() {
        Client.registerAccount(context: registerClientContext, success: {
          self.registrationSuccess(response: true as Any)
        }, failure: { error in
          self.registrationError(error: error)
        })
      }
    } catch {
      self.registrationError(error: error)
    }
  }

  private func isProcessing(_ boolean: Bool) {
    isProcessing.value = boolean
  }

  private func makeRegisterClientContext() throws -> ClientRegisterAccountContext? {
    guard let registrationTypeRawValue = registrationType.value, let registrationType = RegistrationType(rawValue: registrationTypeRawValue) else {
      return nil
    }

    guard let login = login.value, let password = password.value else {
      return nil
    }

    var registerClientContext: ClientRegisterAccountContext!

    switch registrationType {
    case .email: registerClientContext = ClientRegisterAccountContext(email: login, password: password)
    }

    let agreements = ClientAgreements()
    agreements.email = true
    agreements.sms = true
    agreements.push = true
    agreements.bluetooth = true
    agreements.rfid = true
    agreements.wifi = true

    registerClientContext.agreements = agreements

    if let firstname = self.firstName.value {
      registerClientContext.firstName = firstname
    }

    if let lastName = self.lastName.value {
      registerClientContext.lastName = lastName
    }

    return registerClientContext
  }

  private func registrationSuccess(response: Any) {
    isProcessing(false)

    guard !onSuccessClosures.isEmpty else {
      return
    }

    for closure in onSuccessClosures {
      closure(response)
    }
  }

  private func registrationError(error: Error) {
    isProcessing(false)

    guard onErrorClosures.isEmpty == false else {
      return
    }

    for closure in onErrorClosures {
      closure(error)
    }
  }
}

extension UserRegistrationFormViewModel: UserRegistrationFormViewDelegate {
  func signUpButtonWasClicked(_ userRegistrationFormView: UserRegistrationFormView, _ sender: UIButton) {
    executeRegister()
  }
}
