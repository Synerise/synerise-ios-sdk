//
//  SingleTriggeredInlineInAppMessageViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class SingleTriggeredInlineInAppMessageViewController: SingleInlineInAppViewController {
  private enum Source {
    case placementKey(String)
    case eventAction(String)
    case dictionary([AnyHashable: Any])
  }

  override var prefersStatusBarHidden: Bool {
    return self.isOverlay == true
  }

  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .slide
  }

  var initialComponentSize: CGSize?
  var isFullScreen: Bool = false
  var isModal: Bool = false
  var isOverlay: Bool = false
  var shouldRender: Bool = true

  private let source: Source

  private var inlineInAppView: InlineInAppView?
  private var inlineInAppViewConstraints: [NSLayoutConstraint] = []
  private var inlineInAppViewWidthConstraint: NSLayoutConstraint?
  private var inlineInAppViewHeightConstraint: NSLayoutConstraint?
  private var componentLoadingStarted: Bool = false
  private var componentAttached: Bool = false

  private var activityIndicatorView: UIActivityIndicatorView?
  private var loadingTimer: Timer?
  private let loadingTimeoutInterval: TimeInterval = 5

  private lazy var errorLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.textAlignment = .center
    label.textColor = .systemRed
    label.font = .systemFont(ofSize: 16, weight: .medium)
    label.isHidden = true
    return label
  }()

  private var inlineInAppLogs: [String] = []

  // MARK: - Lifecycle

  init(placementKey: String) {
    self.source = .placementKey(placementKey)
    super.init(nibName: nil, bundle: nil)
  }

  init(eventAction: String) {
    self.source = .eventAction(eventAction)
    super.init(nibName: nil, bundle: nil)
  }

  init(inAppMessageDictionary: [AnyHashable: Any]) {
    self.source = .dictionary(inAppMessageDictionary)
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Inherited

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = {
      switch self.source {
      case let .placementKey(placementKey):
        return "(Placement Key: \(placementKey))"
      case let .eventAction(eventAction):
        return "(Event action: \(eventAction))"
      case .dictionary:
        return "Single Inline In-App Message"
      }
    }()
    self.view.backgroundColor = .white

    prepareBackButton()

    Injector.setInlineInAppMessageDelegate(self)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    if self.isModal {
      self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    loadComponentIfNeeded()
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)

    let isBeingRemoved = self.isMovingFromParent || self.isBeingDismissed || self.navigationController?.isBeingDismissed == true
    guard isBeingRemoved == true else { return }

    removeComponentIfNeeded()
    disableInAppMessagesLiveOptions()
    Injector.setInlineInAppMessageDelegate(nil)
  }

  // MARK: - Private

  private func loadComponentIfNeeded() {
    guard self.componentLoadingStarted == false else {
      return
    }
    self.componentLoadingStarted = true

    switch self.source {
    case let .placementKey(placementKey):
      loadComponent(placementKey: placementKey)
    case let .eventAction(eventAction):
      loadComponent(eventAction: eventAction)
    case let .dictionary(inAppMessageDictionary):
      loadComponent(inAppMessageDictionary: inAppMessageDictionary)
    }
  }

  private func loadComponent(placementKey: String) {
    guard let inlineInAppView = Injector.createInlineInAppView(placementKey: placementKey) else {
      return
    }

    attachComponentIfNeeded(inlineInAppView)
    componentAttached(inlineInAppView)

    showActivityIndicator(in: inlineInAppView)
    startLoadingTimer()
  }

  private func loadComponent(eventAction: String) {
    let event = CustomEvent(label: "Inline In-App Message trigger by event", action: eventAction)
    Tracker.send(event)

    showActivityIndicator(in: self.view)
    startLoadingTimer()
  }

  private func loadComponent(inAppMessageDictionary: [AnyHashable: Any]) {
    let selector = NSSelectorFromString("showInlineInAppMessageFromDictionary:")
    if Synerise.responds(to: selector) {
      Synerise.perform(selector, with: inAppMessageDictionary)
    }

    showActivityIndicator(in: self.view)
    startLoadingTimer()
  }

  private func attachComponentIfNeeded(_ inlineInAppView: InlineInAppView) {
    guard
      self.componentAttached == false,
      inlineInAppView.superview == nil
    else {
      return
    }

    inlineInAppView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(inlineInAppView)

    setComponentSizeIfNeeded(inlineInAppView)

    if self.shouldRender == true {
      inlineInAppView.render()
    }
  }

  private func componentAttached(_ inlineInAppView: InlineInAppView) {
    guard self.componentAttached == false else {
      return
    }

    inlineInAppView.delegate = self
    enableInAppMessagesLiveOptions(inlineInAppView, delegate: self)

    self.inlineInAppView = inlineInAppView
    self.componentAttached = true
  }

  private func setComponentSizeIfNeeded(_ inlineInAppView: InlineInAppView) {
    if let initialComponentSize = self.initialComponentSize {
      applyFixedSizeConstraints(inlineInAppView, size: initialComponentSize)
    } else if self.isModal {
      applyConstraints([
        inlineInAppView.topAnchor.constraint(equalTo: self.view.topAnchor),
        inlineInAppView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        inlineInAppView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        inlineInAppView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
      ])
    } else {
      applyConstraints([
        inlineInAppView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        inlineInAppView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        inlineInAppView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        inlineInAppView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
      ])
    }
  }

  private func changeComponentSize(width: CGFloat, height: CGFloat) {
    guard let inlineInAppView = self.inlineInAppView else {
      return
    }

    if let widthConstraint = self.inlineInAppViewWidthConstraint, let heightConstraint = self.inlineInAppViewHeightConstraint {
      widthConstraint.constant = width
      heightConstraint.constant = height
    } else {
      applyFixedSizeConstraints(inlineInAppView, size: CGSize(width: width, height: height))
    }
    self.view.layoutIfNeeded()
  }

  private func applyFixedSizeConstraints(_ inlineInAppView: InlineInAppView, size: CGSize) {
    let widthConstraint = inlineInAppView.widthAnchor.constraint(equalToConstant: size.width)
    let heightConstraint = inlineInAppView.heightAnchor.constraint(equalToConstant: size.height)
    applyConstraints([
      inlineInAppView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      inlineInAppView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      widthConstraint,
      heightConstraint
    ])

    self.inlineInAppViewWidthConstraint = widthConstraint
    self.inlineInAppViewHeightConstraint = heightConstraint
  }

  private func applyConstraints(_ constraints: [NSLayoutConstraint]) {
    deactivateConstraints()

    NSLayoutConstraint.activate(constraints)
    self.inlineInAppViewConstraints = constraints
  }

  private func deactivateConstraints() {
    NSLayoutConstraint.deactivate(self.inlineInAppViewConstraints)

    self.inlineInAppViewConstraints = []
    self.inlineInAppViewWidthConstraint = nil
    self.inlineInAppViewHeightConstraint = nil
  }

  private func removeComponentIfNeeded() {
    guard
      let inlineInAppView = self.inlineInAppView,
      inlineInAppView.superview != nil
    else {
      return
    }

    removeComponent(inlineInAppView)
  }

  private func removeComponent(_ inlineInAppView: InlineInAppView) {
    deactivateConstraints()
    inlineInAppView.removeFromSuperview()

    self.inlineInAppView = nil
    self.componentAttached = false
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

  private func startLoadingTimer() {
    self.loadingTimer?.invalidate()
    self.loadingTimer = Timer.scheduledTimer(withTimeInterval: loadingTimeoutInterval, repeats: false) { [weak self] _ in
      self?.loadingTimer = nil
      self?.hideActivityIndicator()

      switch self?.source {
      case let .eventAction(eventAction):
        self?.presentAlert(title: "Error", message: "Timeout (There is no campaign for this event (`\(eventAction)`)")
        return

      default:
        self?.presentAlert(title: "Error", message: "Timeout (5 seconds is not enough to load campaign)")
        return
      }
    }
  }

  private func stopLoadingTimer() {
    self.loadingTimer?.invalidate()
    self.loadingTimer = nil
  }

  private func showError(_ error: NSError) {
    if self.errorLabel.superview == nil {
      self.view.addSubview(self.errorLabel)
      NSLayoutConstraint.activate([
        self.errorLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        self.errorLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        self.errorLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 16),
        self.errorLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor, constant: -16)
      ])
    }

    self.errorLabel.text = "\(error.code) \(error.localizedDescription)"
    self.errorLabel.isHidden = false
    self.view.bringSubviewToFront(self.errorLabel)
  }

  private func saveLog(_ log: String) {
    self.inlineInAppLogs.append(log)
  }
}

// MARK: - InAppMessagesLiveOptionsViewControllerDelegate

extension SingleTriggeredInlineInAppMessageViewController: InAppMessagesLiveOptionsViewControllerDelegate {
  func getLog() -> String {
    return self.inlineInAppLogs.joined(separator: "\n")
  }

  func notifyInAppContextChangeIsNeeded() {
    guard let _ = self.inlineInAppView else {
      return
    }

    Injector.notifyInAppContextChange()
  }

  func changeComponentSizeIsNeeded(width: CGFloat, height: CGFloat) {
    changeComponentSize(width: width, height: height)
  }

  func invokeRenderOnComponentIsNeeded() {
    guard let inlineInAppView = self.inlineInAppView else {
      return
    }

    inlineInAppView.render()
  }

  func showOnComponent() {
    self.inlineInAppView?.isHidden = false
  }

  func hideOnComponent() {
    self.inlineInAppView?.isHidden = true
  }

  func addToViewHierarchyOnComponent() {
    guard let inlineInAppView = self.inlineInAppView, inlineInAppView.superview == nil else {
      return
    }

    self.view.addSubview(inlineInAppView)
    NSLayoutConstraint.activate(self.inlineInAppViewConstraints)
    self.view.layoutIfNeeded()
  }

  func removeFromViewHierarchyOnComponent() {
    guard let inlineInAppView = self.inlineInAppView, inlineInAppView.superview != nil else {
      return
    }

    NSLayoutConstraint.deactivate(self.inlineInAppViewConstraints)
    inlineInAppView.removeFromSuperview()
  }

  func detachOnComponent() {
    guard let component = self.inlineInAppView else {
      return
    }

    removeComponent(component)
  }

  func forceCloseOnComponent() {
    guard let component = self.inlineInAppView else {
      return
    }

    removeComponent(component)

    if self.isModal || self.isOverlay {
      self.dismiss(animated: true)
    } else {
      self.navigationController?.popViewController(animated: true)
    }
  }

  func pushNewViewController() {
    let viewController = UIViewController()
    viewController.navigationItem.title = "New View Controller"
    viewController.view.backgroundColor = .lightGray

    self.navigationController?.pushViewController(viewController, animated: true)
  }

  func closeInAppMessageWithCampaignHash() {
    guard
      let component = self.inlineInAppView,
      let campaignHash = component.getData()?.campaignHash
    else {
      return
    }

    Injector.closeInAppMessage(campaignHash: campaignHash)
  }
}

// MARK: - InjectorInlineInAppMessageDelegate

extension SingleTriggeredInlineInAppMessageViewController: InjectorInlineInAppMessageDelegate {
  func snr_inlineInAppMessageDidBecomeAvailable(view: InlineInAppView, data: InlineInAppMessageData) {
    saveLog("snr_inlineInAppMessageDidBecomeAvailable(view:data:)")
    hideActivityIndicator()
    stopLoadingTimer()
    UserInfoMessageManager.shared.hideAll()
    UserInfoMessageManager.shared.success("snr_inlineInAppMessageDidBecomeAvailable(view:data:)", nil)

    attachComponentIfNeeded(view)
    componentAttached(view)
  }

  func snr_inlineInAppMessageContextIsNeeded(data: InlineInAppMessageData) -> [AnyHashable: Any]? {
    saveLog("snr_inlineInAppMessageContextIsNeeded(data:)")
    return nil
  }

  func snr_inlineInAppMessageHandledAction(data: InlineInAppMessageData, url: URL) {
    saveLog("snr_inlineInAppMessageHandledAction(data:url:)")
  }

  func snr_inlineInAppMessageHandledAction(data: InlineInAppMessageData, deepLink: String) {
    saveLog("snr_inlineInAppMessageHandledAction(view:data:deepLink:)")
  }

  func snr_inlineInAppMessageHandledCustomAction(data: InlineInAppMessageData, name: String, parameters: [AnyHashable: Any]) {
    saveLog("snr_inlineInAppMessageHandledCustomAction(data:name:parameters:)")
  }

  func snr_inlineInAppMessageHandledCustomMethod(data: InlineInAppMessageData, name: String, parameters: [AnyHashable: Any], completion: InAppCustomMethodCompletion) {
    saveLog("snr_inlineInlineInAppMessageHandledCustomMethod(data:name:parameters:completion:)")
    SyneriseManager.snr_inAppMessageHandledCustomMethod(data: data, name: name, parameters: parameters, completion: completion)
  }
}

// MARK: - InlineInAppViewDelegate

extension SingleTriggeredInlineInAppMessageViewController: InlineInAppViewDelegate {
  func snr_inlineInAppViewDidLoad(view: InlineInAppView, data: InlineInAppMessageData) {
    saveLog("snr_inlineInAppViewDidLoad(view:data:)")
    hideActivityIndicator()
    stopLoadingTimer()
    UserInfoMessageManager.shared.hideAll()
    UserInfoMessageManager.shared.success("snr_inlineInAppViewDidLoad(view:data:)", nil)

    componentAttached(view)
  }

  func snr_inlineInAppViewDidStartProcessing(view: InlineInAppView) {
    saveLog("snr_inlineInAppViewDidStartProcessing(view:data:)")
  }

  func snr_inlineInAppViewChangeSizeIsNeeded(view: InlineInAppView, data: InlineInAppMessageData, size: InlineInAppSize) {
    saveLog("snr_inlineInAppViewChangeSizeIsNeeded(view:data:size:)")
    changeComponentSize(width: size.widthPt, height: size.heightPt)
  }

  func snr_inlineInAppViewDidUpdate(view: InlineInAppView, data: InlineInAppMessageData) {
    saveLog("snr_inlineInAppViewDidUpdate(view:data:)")
  }

  func snr_inlineInAppViewDidFail(view: InlineInAppView, error: NSError) {
    saveLog("snr_inlineInAppViewDidFail(view:error:)")
    hideActivityIndicator()
    stopLoadingTimer()
    UserInfoMessageManager.shared.hideAll()
    UserInfoMessageManager.shared.error("snr_inlineInAppViewDidFail(view:error:)", "\(error.code) \(error.localizedDescription)")

    showError(error)
  }

  func snr_inlineInAppViewShouldBeRemoved(view: InlineInAppView, data: InlineInAppMessageData) {
    saveLog("snr_inlineInAppViewShouldBeRemoved(view:data:)")

    if self.isModal {
      self.dismiss(animated: true)
    } else {
      removeComponent(view)
    }
  }
}
