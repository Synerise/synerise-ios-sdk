//
//  ShowTwoInlineInAppMessagesViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ShowTwoInlineInAppMessagesViewController: DefaultViewController {
  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .slide
  }
  
  @IBOutlet var firstInlineInAppContainerView: UIView!
  @IBOutlet var secondInlineInAppContainerView: UIView!
  
  private var firstInlineInAppView: InlineInAppView?
  private var secondInlineInAppView: InlineInAppView?
  
  private var activityIndicatorView: UIActivityIndicatorView?
  private var componentLoadingStarted: Bool = false
  private var componentAttached: Bool = false
  
  // MARK: - Inherited

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title =  "Two Inline In-App Messages"
    self.view.backgroundColor = .white

    prepareBackButton()
    Injector.setInlineInAppMessageDelegate(self)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    loadComponentIfNeeded()
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)

    let isBeingRemoved = self.isMovingFromParent || self.isBeingDismissed || self.navigationController?.isBeingDismissed == true
    guard isBeingRemoved == true else { return }

    Injector.setInlineInAppMessageDelegate(nil)
  }
  
  // MARK: - Private
  
  private func loadComponentIfNeeded() {
    guard self.componentLoadingStarted == false else {
      return
    }
    self.componentLoadingStarted = true

    let inAppMessageDictionary1 = InAppMessagesDictionaryData.getStorageDebugFullScreen(includeSafeArea: false)
    let inAppMessageDictionary2 = InAppMessagesDictionaryData.getStorageDebugFullScreen(includeSafeArea: false)
    
    loadComponent(inAppMessageDictionary: inAppMessageDictionary1)
    loadComponent(inAppMessageDictionary: inAppMessageDictionary2)
  }
  
  private func loadComponent(inAppMessageDictionary: [AnyHashable: Any]) {
    let selector = NSSelectorFromString("showInlineInAppMessageFromDictionary:")
    if Synerise.responds(to: selector) {
      Synerise.perform(selector, with: inAppMessageDictionary)
    }
  }
  
  private func showActivityIndicator(in superview: UIView) {
    guard self.activityIndicatorView == nil else {
      return
    }

    let activityIndicatorView = UIActivityIndicatorView(style: .medium)
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    activityIndicatorView.hidesWhenStopped = true
    superview.addSubview(activityIndicatorView)

    NSLayoutConstraint.activate([
      activityIndicatorView.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
      activityIndicatorView.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
    ])

    activityIndicatorView.startAnimating()
    self.activityIndicatorView = activityIndicatorView
  }

  private func hideActivityIndicator() {
    self.activityIndicatorView?.stopAnimating()
    self.activityIndicatorView?.removeFromSuperview()
    self.activityIndicatorView = nil
  }
}

// MARK: - InjectorInlineInAppMessageDelegate

extension ShowTwoInlineInAppMessagesViewController: InjectorInlineInAppMessageDelegate {
  func snr_inlineInAppMessageDidBecomeAvailable(view: InlineInAppView, data: InlineInAppMessageData) {
    if self.firstInlineInAppView == nil {
      view.frame.size = self.firstInlineInAppContainerView.frame.size
      view.delegate = self
      self.firstInlineInAppContainerView.addSubview(view)
      self.firstInlineInAppView = view
      return
    }
    
    if self.secondInlineInAppView == nil {
      view.frame.size = self.secondInlineInAppContainerView.frame.size
      view.delegate = self
      self.secondInlineInAppContainerView.addSubview(view)
      self.secondInlineInAppView = view
      return
    }
  }

  func snr_inlineInAppMessageContextIsNeeded(data: InlineInAppMessageData) -> [AnyHashable: Any]? {

    return nil
  }

  func snr_inlineInAppMessageHandledAction(data: InlineInAppMessageData, url: URL) {

  }

  func snr_inlineInAppMessageHandledAction(data: InlineInAppMessageData, deepLink: String) {

  }

  func snr_inlineInAppMessageHandledCustomAction(data: InlineInAppMessageData, name: String, parameters: [AnyHashable: Any]) {

  }

  func snr_inlineInAppMessageHandledCustomMethod(data: InlineInAppMessageData, name: String, parameters: [AnyHashable: Any], completion: InAppCustomMethodCompletion) {
    SyneriseManager.snr_inAppMessageHandledCustomMethod(data: data, name: name, parameters: parameters, completion: completion)
  }
}

// MARK: - InlineInAppViewDelegate

extension ShowTwoInlineInAppMessagesViewController: InlineInAppViewDelegate {
  func snr_inlineInAppViewDidLoad(view: InlineInAppView, data: InlineInAppMessageData) {

  }

  func snr_inlineInAppViewDidStartProcessing(view: InlineInAppView) {

  }

  func snr_inlineInAppViewChangeSizeIsNeeded(view: InlineInAppView, data: InlineInAppMessageData, size: InlineInAppSize) {

  }

  func snr_inlineInAppViewDidUpdate(view: InlineInAppView, data: InlineInAppMessageData) {

  }

  func snr_inlineInAppViewDidFail(view: InlineInAppView, error: NSError) {

  }

  func snr_inlineInAppViewShouldBeRemoved(view: InlineInAppView, data: InlineInAppMessageData) {

  }
}
