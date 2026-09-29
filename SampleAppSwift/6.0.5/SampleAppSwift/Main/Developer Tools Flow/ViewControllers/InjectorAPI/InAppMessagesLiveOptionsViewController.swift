//
//  InAppMessagesLiveOptionsViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

protocol InAppMessagesLiveOptionsViewControllerDelegate: AnyObject {
  func getLog() -> String
  func notifyInAppContextChangeIsNeeded()
  func changeComponentSizeIsNeeded(width: CGFloat, height: CGFloat)
  func invokeRenderOnComponentIsNeeded()
  func showOnComponent()
  func hideOnComponent()
  func addToViewHierarchyOnComponent()
  func removeFromViewHierarchyOnComponent()
  func detachOnComponent()
  func forceCloseOnComponent()
  func pushNewViewController()
  func closeInAppMessageWithCampaignHash()
}

class InAppMessagesLiveOptionsViewController: DefaultViewController {
  weak var delegate: InAppMessagesLiveOptionsViewControllerDelegate?
  var onCloseButton: (() -> Void)?

  // MARK: - IBAction

  @IBAction func getLog() {
    let log = self.delegate?.getLog() ?? "-"
    pushDebugViewController(text: log)
  }

  @IBAction func invokeRenderOnComponent() {
    onCloseButton?()
    self.delegate?.invokeRenderOnComponentIsNeeded()
  }

  @IBAction func pushNewViewController() {
    onCloseButton?()
    self.delegate?.pushNewViewController()
  }

  // MARK: - Inherited

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "VIEW_CONTROLLER_LIVE_IN_APPS_OPTIONS_MENU_TITLE".localized()

    prepareCloseRightMenuButton()
    prepareBackButton()
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)

    if let manageInAppContextViewController = segue.destination as? ManageInAppContextViewController {
      manageInAppContextViewController.onNotifyInAppContextChangeButton = { [weak self] in
        self?.delegate?.notifyInAppContextChangeIsNeeded()
        self?.onCloseButton?()
      }
    }

    if let changeInAppMessageSizeViewController = segue.destination as? ChangeInAppMessageSizeViewController {
      changeInAppMessageSizeViewController.onChangeComponentSizeButton = { [weak self] width, height in
        self?.delegate?.changeComponentSizeIsNeeded(width: width, height: height)
        self?.onCloseButton?()
      }
    }

    if let changeInAppMessageVisibilityViewController = segue.destination as? ChangeInAppMessageVisibilityViewController {
      changeInAppMessageVisibilityViewController.onShowComponentButton = { [weak self] in
        self?.delegate?.showOnComponent()
        self?.onCloseButton?()
      }
      changeInAppMessageVisibilityViewController.onHideComponentButton = { [weak self] in
        self?.delegate?.hideOnComponent()
        self?.onCloseButton?()
      }
      changeInAppMessageVisibilityViewController.onAddComponentToViewHierarchyButton = { [weak self] in
        self?.delegate?.addToViewHierarchyOnComponent()
        self?.onCloseButton?()
      }
      changeInAppMessageVisibilityViewController.onRemoveComponentFromViewHierarchyButton = { [weak self] in
        self?.delegate?.removeFromViewHierarchyOnComponent()
        self?.onCloseButton?()
      }
      changeInAppMessageVisibilityViewController.onDetachButton = { [weak self] in
        self?.delegate?.detachOnComponent()
        self?.onCloseButton?()
      }
      changeInAppMessageVisibilityViewController.onInvokeCloseOnInjectorModuleButton = { [weak self] in
        self?.delegate?.closeInAppMessageWithCampaignHash()
        self?.onCloseButton?()
      }
      changeInAppMessageVisibilityViewController.onForceCloseButton = { [weak self] in
        self?.delegate?.forceCloseOnComponent()
        self?.onCloseButton?()
      }
    }

    if let triggerInAppMessageViewController = segue.destination as? TriggerInAppMessageViewController {
      triggerInAppMessageViewController.onSendEventButton = { [weak self] in
        self?.onCloseButton?()
      }
    }
  }

  // MARK: - Private

  func prepareCloseRightMenuButton() {
    let buttonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.closeButtonWasPressed))
    buttonItem.tintColor = UIColor.black

    self.navigationItem.rightBarButtonItem = buttonItem
  }

  @objc private func closeButtonWasPressed() {
    onCloseButton?()
  }
}
