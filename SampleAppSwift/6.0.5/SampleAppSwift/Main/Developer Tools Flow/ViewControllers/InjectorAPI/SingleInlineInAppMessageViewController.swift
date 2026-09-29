//
//  SingleInlineInAppMessageViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class SingleInlineInAppViewController: DefaultViewController {
  private var inAppMessagesLiveOptionsViewController: InAppMessagesLiveOptionsViewController?
  private weak var inAppMessagesLiveOptionsViewControllerDelegate: InAppMessagesLiveOptionsViewControllerDelegate?
  private var inAppMessageLiveOptionsWindow: UIWindow?

  // MARK: - Inherited

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    becomeFirstResponder()
  }

  override var canBecomeFirstResponder: Bool {
    return true
  }

  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      showLiveInAppMessageOptions()
    }
  }

  func enableInAppMessagesLiveOptions(_ view: InlineInAppView, delegate: InAppMessagesLiveOptionsViewControllerDelegate) {
    self.inAppMessagesLiveOptionsViewControllerDelegate = delegate
  }

  func disableInAppMessagesLiveOptions() {
    self.inAppMessagesLiveOptionsViewControllerDelegate = nil
  }

  func showLiveInAppMessageOptions() {
    guard let delegate = self.inAppMessagesLiveOptionsViewControllerDelegate else {
      return
    }

    let inAppMessagesLiveOptionsViewController: InAppMessagesLiveOptionsViewController = makeLiveInAppMessagesOptionsViewController()
    inAppMessagesLiveOptionsViewController.delegate = delegate
    inAppMessagesLiveOptionsViewController.onCloseButton = { [weak self] in
      self?.dismissLiveInAppMessageOptions()
    }

    let navigationController = UINavigationController(rootViewController: inAppMessagesLiveOptionsViewController)
    navigationController.title = "VIEW_CONTROLLER_LIVE_IN_APP_MESSAGE_OPTIONS_TITLE".localized()

    let window: UIWindow
    if #available(iOS 13.0, *),
       let windowScene = UIApplication.shared.connectedScenes
       .compactMap({ $0 as? UIWindowScene })
       .first(where: { $0.activationState == .foregroundActive })
    {
      window = UIWindow(windowScene: windowScene)
    } else {
      window = UIWindow(frame: UIScreen.main.bounds)
    }
    window.windowLevel = .alert + 1
    window.rootViewController = navigationController
    window.makeKeyAndVisible()

    navigationController.view.transform = CGAffineTransform(translationX: 0, y: window.bounds.height)
    navigationController.view.alpha = 0
    UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut) {
      navigationController.view.transform = .identity
      navigationController.view.alpha = 1
    }

    self.inAppMessagesLiveOptionsViewController = inAppMessagesLiveOptionsViewController
    self.inAppMessageLiveOptionsWindow = window
  }

  private func dismissLiveInAppMessageOptions() {
    self.inAppMessageLiveOptionsWindow?.isHidden = true
    self.inAppMessageLiveOptionsWindow = nil
  }

  private func makeLiveInAppMessagesOptionsViewController() -> InAppMessagesLiveOptionsViewController {
    let storyboard: UIStoryboard = Storyboards.getInAppMessagesLiveOptions()
    guard let viewController = StoryboardUtils.instantiateViewController("LiveInlineInAppMessagesOptionsViewController", storyboard: storyboard) as? InAppMessagesLiveOptionsViewController else {
      fatalError()
    }

    return viewController
  }
}
