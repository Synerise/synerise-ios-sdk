//
//  InAppMessagesViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class InAppMessagesViewController: DefaultViewController {
  // MARK: - IBAction

  @IBAction func presentSingleToLoadInlineInAppMessageViewController() {
    let viewController = SingleToLoadInlineInAppMessageViewController()
    self.navigationController?.pushViewController(viewController, animated: true)
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "In-App Messages"

    prepareBackButton()
  }
}
