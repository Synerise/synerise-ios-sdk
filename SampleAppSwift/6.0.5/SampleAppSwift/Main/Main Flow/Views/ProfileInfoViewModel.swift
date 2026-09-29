//
//  ProfileInfoViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ProfileInfoViewModel {
  var isProcessing: ObservingType<Bool> = ObservingType(false)
  var isDownloaded: ObservingType<Bool> = ObservingType(false)

  var avatarURL: ObservingType<URL>
  var name: BindingType<String>
  var email: BindingType<String>

  private var dataDownloaded: Bool = false

  // MARK: - Init

  init() {
    self.avatarURL = ObservingType<URL>()
    self.name = BindingType<String>("")
    self.email = BindingType<String>("")
  }

  // MARK: - Public

  func downloadDataIfNeeded() {
    if dataDownloaded {
      return
    }

    self.isProcessing.value = true

    Client.getAccount(success: { clientAccountInformation in
      self.isProcessing.value = false
      self.profileDataDownloaded(clientAccountInformation)

      Content.generateDocument(slug: "points", success: { document in
        self.pointsDataDownloaded(document.content!)

        self.isProcessing.value = false
        self.isDownloaded.value = true
      }) { error in
        DebugUtils.print(error.localizedDescription)

        self.isProcessing.value = false
      }
    }, failure: { error in
      self.isProcessing.value = false

      DebugUtils.print(error.localizedDescription)
    })
  }

  // MARK: - Private

  private func profileDataDownloaded(_ data: ClientAccountInformation) {
    self.name.value = "\(data.firstName ?? "") \(data.lastName ?? "")"
    self.email.value = data.email
  }

  private func pointsDataDownloaded(_ data: [AnyHashable: Any]) {
    if let email = self.email.value,
       let content = data["content"] as? [AnyHashable: Any],
       let points = content["points"] as? String
    {
      self.email.value = "\(email)\n\nAvailable points: \(points)"
    }
  }
}
