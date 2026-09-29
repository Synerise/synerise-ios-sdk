//
//  TestViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import Foundation
import SyneriseSDK

class TestViewController: DefaultViewController {
  private var inlineInAppView: InlineInAppView?

  override func viewDidLoad() {
    super.viewDidLoad()

    prepareLeftMenuButton()
    createInlineInAppMessage()

    self.view.backgroundColor = UIColor.white
  }

  // MARK: - IBAction

  func createInlineInAppMessage() {
//    guard let placementKey = self.placementKeyTextField.text, placementKey.isEmpty == false else {
//      return
//    }

    if let existingInlineInAppView = self.inlineInAppView {
      existingInlineInAppView.removeFromSuperview()
      self.inlineInAppView = nil
    }

    guard let inlineInAppView = Injector.createInlineInAppView(placementKey: "test") else {
      return
    }

    inlineInAppView.delegate = self
    inlineInAppView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(inlineInAppView)

    NSLayoutConstraint.activate([
      inlineInAppView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      inlineInAppView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      inlineInAppView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      inlineInAppView.heightAnchor.constraint(equalToConstant: 400)
    ])

    self.inlineInAppView = inlineInAppView
  }
}

// MARK: - InlineInAppViewDelegate

extension TestViewController: InlineInAppViewDelegate {
  func snr_inlineInAppMessageDidBecomeAvailable(view: InlineInAppView, data: InlineInAppMessageData) {
    // nothing for yet
  }

  func snr_inlineInAppViewDidLoad(view: InlineInAppView, data: InlineInAppMessageData) {
    // nothing for yet
  }

  func snr_inlineInAppViewDidUpdate(view: InlineInAppView, data: InlineInAppMessageData) {
    // nothing for yet
  }

  func snr_inlineInAppViewDidFail(view: InlineInAppView, data: InlineInAppMessageData, error: NSError) {
    // nothing for yet
  }

  func snr_inlineInAppViewShouldBeRemoved(view: InlineInAppView, data: InlineInAppMessageData) {
    self.inlineInAppView?.removeFromSuperview()
  }

  func snr_inlineInAppViewHandledAction(view: InlineInAppView, data: InlineInAppMessageData, url: URL) {
    // nothing for yet
  }

  func snr_inlineInAppViewHandledAction(view: InlineInAppView, data: InlineInAppMessageData, deepLink: String) {
    // nothing for yet
  }

  func snr_inlineInAppViewHandledCustomAction(view: InlineInAppView, data: InlineInAppMessageData, name: String, parameters: [AnyHashable: Any]) {
    // nothing for yet
  }
}
