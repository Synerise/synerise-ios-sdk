//
//  TriggerInlineInAppMessageViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class TriggerInlineInAppMessageViewController: DefaultViewController {
  @IBOutlet var containerStackView: UIStackView!

  @IBOutlet var placementKeyOrEventSegmentedControl: UISegmentedControl!
  @IBOutlet var placementKeyOrEventTextField: UITextField!
  @IBOutlet var shouldRenderSwitch: UISwitch!
  @IBOutlet var shouldPreloadBeforeRenderSwitch: UISwitch!
  @IBOutlet var howToPresentSegmentedControl: UISegmentedControl!
  @IBOutlet var initialComponentWidthTextField: UITextField!
  @IBOutlet var initialComponentHeightTextField: UITextField!

  @IBOutlet var triggerInlineInAppMessageButton: UIButton!
  @IBOutlet var preloadInlineInAppMessageButton: UIButton!
  @IBOutlet var preloadInlineInAppMessageWithHackZeroButton: UIButton!

  private var preloadedComponent: InlineInAppView?
  private var isPreloadingWithPlacementKey: Bool = false
  private var isPreloadingByEvent: Bool = false
  private var isWaitingForPreloadedComponent: Bool = false
  private var shouldShowPreloadedComponent: Bool = false
  private var shouldAttachPreloadedComponentWithSizeZeroHack: Bool = false

  private var preloadingTimer: Timer?
  private let preloadingTimeoutInterval: TimeInterval = 5

  // MARK: - IBAction

  @IBAction func triggerInlineInAppMessage() {
    if self.placementKeyOrEventSegmentedControl.selectedSegmentIndex == 0 {
      self.triggerInlineInAppMessageForPlacementKey()
    } else {
      self.triggerInlineInAppMessageForEvent()
    }
  }

  @IBAction func triggerInlineInAppMessageForPlacementKey() {
    guard let placementKey = self.placementKeyOrEventTextField.text, placementKey.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`Placement Key` is required")
      return
    }

    if self.shouldPreloadBeforeRenderSwitch.isOn == true {
      preloadComponent(placementKey: placementKey, shouldShowWhenLoaded: true)
    } else {
      let viewController = SingleTriggeredInlineInAppMessageViewController(placementKey: placementKey)
      viewController.shouldRender = self.shouldRenderSwitch.isOn
      present(viewController)
    }
  }

  @IBAction func triggerInlineInAppMessageForEvent() {
    guard let eventAction = self.placementKeyOrEventTextField.text, eventAction.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`Event` is required")
      return
    }

    if self.shouldPreloadBeforeRenderSwitch.isOn == true {
      preloadComponent(eventAction: eventAction, shouldShowWhenLoaded: true)
    } else {
      let viewController = SingleTriggeredInlineInAppMessageViewController(eventAction: eventAction)
      viewController.shouldRender = self.shouldRenderSwitch.isOn
      present(viewController)
    }
  }

  @IBAction func preloadInlineInAppMessage() {
    self.shouldAttachPreloadedComponentWithSizeZeroHack = false

    if self.placementKeyOrEventSegmentedControl.selectedSegmentIndex == 0 {
      self.preloadInlineInAppMessageForPlacementKey()
    } else {
      self.preloadInlineInAppMessageForEvent()
    }
  }

  @IBAction func preloadInlineInAppMessageWithSizeZeroHack() {
    self.shouldAttachPreloadedComponentWithSizeZeroHack = true

    if self.placementKeyOrEventSegmentedControl.selectedSegmentIndex == 0 {
      self.preloadInlineInAppMessageForPlacementKey()
    } else {
      self.preloadInlineInAppMessageForEvent()
    }
  }

  @IBAction func preloadInlineInAppMessageForPlacementKey() {
    guard let placementKey = self.placementKeyOrEventTextField.text, placementKey.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`Placement Key` is required")
      return
    }

    if self.shouldAttachPreloadedComponentWithSizeZeroHack == false {
      if self.shouldRenderSwitch.isOn == false {
        self.presentAlert(title: "Error", message: "`Should invoke `render` method` is required for preloading by `Event`")
        return
      }
    }

    self.isPreloadingWithPlacementKey = true
    self.isPreloadingByEvent = false

    preloadComponent(placementKey: placementKey, shouldShowWhenLoaded: false)
  }

  @IBAction func preloadInlineInAppMessageForEvent() {
    guard let eventAction = self.placementKeyOrEventTextField.text, eventAction.isEmpty == false else {
      self.presentAlert(title: "Error", message: "`Event` is required")
      return
    }

    if self.shouldRenderSwitch.isOn == true {
      self.presentAlert(title: "Error", message: "`Should invoke `render` method` is disabled for preloading by `Event`")
      return
    }

    self.isPreloadingWithPlacementKey = false
    self.isPreloadingByEvent = true

    preloadComponent(eventAction: eventAction, shouldShowWhenLoaded: false)
  }

  @IBAction func showPreloadedInAppMessage() {
    guard let inlineInAppView = self.preloadedComponent else {
      self.presentAlert(title: "Error", message: "Component is not preloaded")
      return
    }

    if inlineInAppView.superview != nil {
      inlineInAppView.removeFromSuperview()
    }

    present(SingleLoadedInlineInAppMessageViewController(inlineInAppView: inlineInAppView))
  }

  @objc private func placementKeyOrEventSegmentedControlValueChanged(_ sender: UISegmentedControl) {
    updatePlacementKeyOrEventTextField()
  }

  @objc private func howToPresentSegmentedControlValueChanged(_ sender: UISegmentedControl) {
    updateInitialComponentSizeTextFields()
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "Trigger Inline In-App Message"

    prepareBackButton()
    setup()
    setDefaultSettingsForControls()
  }

  // MARK: - Private

  private enum HowToPresent: Int {
    case `static` = 0
    case fullScreen = 1
    case modal = 2
    case overlay = 3
  }

  private var selectedHowToPresent: HowToPresent {
    HowToPresent(rawValue: self.howToPresentSegmentedControl.selectedSegmentIndex) ?? .static
  }

  private func present(_ viewController: InlineInAppMessagePresentable) {
    viewController.isFullScreen = self.selectedHowToPresent == .fullScreen
    viewController.initialComponentSize = initialComponentSize()

    switch self.selectedHowToPresent {
    case .static, .fullScreen:
      self.navigationController?.pushViewController(viewController, animated: true)

    case .modal:
      viewController.isModal = true
      let navigationController = UINavigationController(rootViewController: viewController)
      navigationController.modalPresentationStyle = .pageSheet
      self.present(navigationController, animated: true)

    case .overlay:
      viewController.isModal = true
      viewController.isOverlay = true
      let navigationController = UINavigationController(rootViewController: viewController)
      navigationController.modalPresentationStyle = .overCurrentContext
      self.present(navigationController, animated: false)
    }
  }

  private func preloadComponent(placementKey: String, shouldShowWhenLoaded: Bool = true) {
    guard let inlineInAppView = Injector.createInlineInAppView(placementKey: placementKey) else {
      return
    }

    inlineInAppView.delegate = self
    inlineInAppView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)

    detachComponentIfNeeded()

    if self.shouldAttachPreloadedComponentWithSizeZeroHack == true {
      attachComponentWithSizeZeroHack(inlineInAppView)
    }

    self.preloadedComponent = inlineInAppView
    self.isWaitingForPreloadedComponent = true
    self.shouldShowPreloadedComponent = shouldShowWhenLoaded
    showLoading()
    startPreloadingTimer()

    if self.shouldRenderSwitch.isOn == true {
      inlineInAppView.render()
    }
  }

  private func preloadComponent(eventAction: String, shouldShowWhenLoaded: Bool = true) {
    Injector.setInlineInAppMessageDelegate(self)
    self.isWaitingForPreloadedComponent = true
    self.shouldShowPreloadedComponent = shouldShowWhenLoaded
    showLoading()
    startPreloadingTimer()

    detachComponentIfNeeded()

    let event = CustomEvent(label: "Inline In-App Message trigger by event", action: eventAction)
    Tracker.send(event)
  }

  private func startPreloadingTimer() {
    self.preloadingTimer?.invalidate()
    self.preloadingTimer = Timer.scheduledTimer(withTimeInterval: preloadingTimeoutInterval, repeats: false) { [weak self] _ in
      self?.preloadingTimer = nil
      self?.hideLoading()

      if self?.isPreloadingByEvent == true {
        self?.presentAlert(title: "Error", message: "Timeout (There is no campaign for this event)")
        return
      }

      if self?.isPreloadingWithPlacementKey == true {
        self?.presentAlert(title: "Error", message: "Timeout (5 seconds is not enough to load campaign)")
        return
      }
    }
  }

  private func stopPreloadingTimer() {
    self.preloadingTimer?.invalidate()
    self.preloadingTimer = nil
  }

  private func presentPreloadedComponent(_ inlineInAppView: InlineInAppView) {
    self.preloadedComponent = nil
    self.shouldShowPreloadedComponent = false
    self.shouldAttachPreloadedComponentWithSizeZeroHack = false

    present(SingleLoadedInlineInAppMessageViewController(inlineInAppView: inlineInAppView))
  }

  private func attachComponentWithSizeZeroHack(_ inlineInAppView: InlineInAppView) {
    inlineInAppView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(inlineInAppView)

    NSLayoutConstraint.activate([
      inlineInAppView.topAnchor.constraint(equalTo: self.view.topAnchor),
      inlineInAppView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      inlineInAppView.widthAnchor.constraint(equalToConstant: 0),
      inlineInAppView.heightAnchor.constraint(equalToConstant: 0)
    ])
  }

  private func detachComponentIfNeeded() {
    if self.preloadedComponent?.superview != nil {
      self.preloadedComponent?.removeFromSuperview()
    }

    self.preloadedComponent = nil
  }

  private func initialComponentSize() -> CGSize? {
    guard self.selectedHowToPresent == .static else {
      return nil
    }

    guard
      let widthText = self.initialComponentWidthTextField.text, let width = Double(widthText),
      let heightText = self.initialComponentHeightTextField.text, let height = Double(heightText)
    else {
      return nil
    }

    return CGSize(width: width, height: height)
  }

  private func setup() {
    self.placementKeyOrEventSegmentedControl.addTarget(self, action: #selector(placementKeyOrEventSegmentedControlValueChanged(_:)), for: .valueChanged)
    self.howToPresentSegmentedControl.addTarget(self, action: #selector(howToPresentSegmentedControlValueChanged(_:)), for: .valueChanged)

    self.placementKeyOrEventTextField.delegate = self
    self.initialComponentWidthTextField.delegate = self
    self.initialComponentHeightTextField.delegate = self
  }

  private func setDefaultSettingsForControls() {
    self.placementKeyOrEventSegmentedControl.selectedSegmentIndex = 0
    self.triggerInlineInAppMessageButton.setTitle("Create component for Placement Key", for: .normal)
    self.preloadInlineInAppMessageButton.setTitle("Preload component for Placement Key", for: .normal)
    self.preloadInlineInAppMessageWithHackZeroButton.setTitle("Preload component for Placement Key (hack)", for: .normal)

    updatePlacementKeyOrEventTextField()
    updateInitialComponentSizeTextFields()
  }

  private func updateInitialComponentSizeTextFields() {
    let isEnabled = self.selectedHowToPresent == .static
    self.initialComponentWidthTextField.isEnabled = isEnabled
    self.initialComponentHeightTextField.isEnabled = isEnabled
  }

  private func updatePlacementKeyOrEventTextField() {
    UIView.setAnimationsEnabled(false)
    if self.placementKeyOrEventSegmentedControl.selectedSegmentIndex == 0 {
      self.placementKeyOrEventTextField.placeholder = "Placement Key"
      self.shouldRenderSwitch.isEnabled = true
      self.triggerInlineInAppMessageButton.setTitle("Create component for Placement Key", for: .normal)
      self.preloadInlineInAppMessageButton.setTitle("Preload component for Placement Key", for: .normal)
      self.preloadInlineInAppMessageWithHackZeroButton.setTitle("Preload component for Placement Key (hack)", for: .normal)
    } else {
      self.placementKeyOrEventTextField.placeholder = "Event action"
      self.shouldRenderSwitch.isEnabled = false
      self.triggerInlineInAppMessageButton.setTitle("Trigger component by Event", for: .normal)
      self.preloadInlineInAppMessageButton.setTitle("Preload component for Event", for: .normal)
      self.preloadInlineInAppMessageWithHackZeroButton.setTitle("Preload component for Event (hack)", for: .normal)
    }
    UIView.setAnimationsEnabled(true)
  }
}

// MARK: - UITextFieldDelegate

extension TriggerInlineInAppMessageViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}

// MARK: - InjectorInlineInAppMessageDelegate

extension TriggerInlineInAppMessageViewController: InjectorInlineInAppMessageDelegate {
  func snr_inlineInAppMessageDidBecomeAvailable(view: InlineInAppView, data: InlineInAppMessageData) {
    if self.isWaitingForPreloadedComponent == true {
      self.isWaitingForPreloadedComponent = false
      self.preloadedComponent = view
      stopPreloadingTimer()
      hideLoading()

      if self.shouldShowPreloadedComponent == true {
        presentPreloadedComponent(view)
        return
      }

      if self.shouldAttachPreloadedComponentWithSizeZeroHack == true {
        attachComponentWithSizeZeroHack(view)
        return
      }
    }
  }
}

// MARK: - InlineInAppViewDelegate

extension TriggerInlineInAppMessageViewController: InlineInAppViewDelegate {
  func snr_inlineInAppViewDidLoad(view: InlineInAppView, data: InlineInAppMessageData) {
    if self.isWaitingForPreloadedComponent == true {
      self.isWaitingForPreloadedComponent = false
      stopPreloadingTimer()
      hideLoading()

      if self.shouldShowPreloadedComponent == true {
        presentPreloadedComponent(view)
      }

      return
    }
  }

  func snr_inlineInAppViewDidFail(view: InlineInAppView, error: NSError) {
    if self.isWaitingForPreloadedComponent == true {
      self.isWaitingForPreloadedComponent = false
      stopPreloadingTimer()
      hideLoading()

      self.presentAlert(title: "Error", message: "\(error.code) \(error.localizedDescription)")
    }
  }
}

// MARK: - InlineInAppMessagePresentable

protocol InlineInAppMessagePresentable: UIViewController {
  var initialComponentSize: CGSize? { get set }
  var isFullScreen: Bool { get set }
  var isModal: Bool { get set }
  var isOverlay: Bool { get set }
}

extension SingleTriggeredInlineInAppMessageViewController: InlineInAppMessagePresentable {}
extension SingleLoadedInlineInAppMessageViewController: InlineInAppMessagePresentable {}
