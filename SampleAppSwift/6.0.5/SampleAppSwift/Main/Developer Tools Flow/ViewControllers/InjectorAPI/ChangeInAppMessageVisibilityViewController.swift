//
//  ChangeInAppMessageVisibilityViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ChangeInAppMessageVisibilityViewController: DefaultViewController {
  var onShowComponentButton: (() -> Void)?
  var onHideComponentButton: (() -> Void)?
  var onAddComponentToViewHierarchyButton: (() -> Void)?
  var onRemoveComponentFromViewHierarchyButton: (() -> Void)?
  var onDetachButton: (() -> Void)?
  var onInvokeCloseOnInjectorModuleButton: (() -> Void)?
  var onForceCloseButton: (() -> Void)?

  // MARK: - IBAction

  @IBAction func showComponent() {
    if let onShowComponentButton = self.onShowComponentButton {
      onShowComponentButton()
    }
  }

  @IBAction func hideComponent() {
    if let onHideComponentButton = self.onHideComponentButton {
      onHideComponentButton()
    }
  }

  @IBAction func addComponentToViewHierarchy() {
    if let onAddComponentToViewHierarchyButton = self.onAddComponentToViewHierarchyButton {
      onAddComponentToViewHierarchyButton()
    }
  }

  @IBAction func removeComponentFromViewHierarchy() {
    if let onRemoveComponentFromViewHierarchyButton = self.onRemoveComponentFromViewHierarchyButton {
      onRemoveComponentFromViewHierarchyButton()
    }
  }

  @IBAction func detachComponent() {
    if let onDetachButton = self.onDetachButton {
      onDetachButton()
    }
  }

  @IBAction func invokeCloseOnInjectorModuleButton() {
    if let onInvokeCloseOnInjectorModuleButton = self.onInvokeCloseOnInjectorModuleButton {
      onInvokeCloseOnInjectorModuleButton()
    }
  }

  @IBAction func forceCloseComponent() {
    if let onForceCloseButton = self.onForceCloseButton {
      onForceCloseButton()
    }
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "Chage In-App component visibility"
    prepareBackButton()
  }
}
