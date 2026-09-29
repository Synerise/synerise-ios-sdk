//
//  ContentAPIViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ContentAPIViewController: DefaultViewController {
  // MARK: IBAction

  @IBAction func getScreenView(_ sender: DefaultButton) {
    let apiQuery = ScreenViewApiQuery(feedSlug: "drzewkafeed")
    showLoading()
    Content.generateScreenView(apiQuery: apiQuery, success: { screenView in
      self.hideLoading()

      self.pushDebugViewController(text: self.makeScreenViewV2(screenView))
    }, failure: { error in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })

    sender.animateTapping()
  }

  @IBAction func getBrickworks(_ sender: DefaultButton) {
    let apiQuery = BrickworksApiQuery(schemaSlug: "konradTestuje", recordId: "7726c219-1deb-4154-9374-d3145de3c833")
    apiQuery.context = [
      "param": 123
    ]
    apiQuery.fieldContext = [
      "similarProducts": [
        "itemId": "c8a42eb1-2582-403e-8497-976f28b479ee",
        "additionalFilter": "brand == TEST"
      ]
    ]

    showLoading()
    Content.generateBrickworks(apiQuery: apiQuery, success: { brickworks in
      self.hideLoading()
      self.pushDebugViewController(text: brickworks.debugDescription)
    }, failure: { error in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
    sender.animateTapping()
  }

  // MARK: Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "VIEW_CONTROLLER_CONTENT_API_TITLE".localized()

    prepareBackButton()
  }

  // MARK: - Private

  private func makeScreenViewV2(_ screenView: ScreenView) -> String {
    let identifier = screenView.identifier
    let hashString = screenView.hashString
    let path = screenView.path
    let name = screenView.name
    let priority = screenView.priority

    let data = screenView.data

    let createdAt = screenView.createdAt
    let updatedAt = screenView.updatedAt

    let screenViewStringRepresentation = """
    ID: \(identifier)
    Hash: \(hashString)
    Path: \(path)
    Name: \(name)
    Priority: \(priority)
    Data: \(data as AnyObject)
    Created At: \(createdAt)
    Updated At: \(updatedAt)
    """

    return screenViewStringRepresentation
  }
}
