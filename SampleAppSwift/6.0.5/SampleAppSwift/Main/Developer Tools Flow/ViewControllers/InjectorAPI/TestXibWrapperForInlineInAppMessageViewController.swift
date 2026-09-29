//
//  TestXibWrapperForInlineInAppMessageViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2026 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class TestXibWrapperForInlineInAppMessageViewController: DefaultViewController {
  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .slide
  }

  @IBOutlet var inlineInAppViewWrapper: InlineInAppViewWrapper?

  private lazy var infoLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    label.textAlignment = .center
    label.textColor = .lightGray
    label.font = .systemFont(ofSize: 15, weight: .bold)
    label.isHidden = true
    return label
  }()

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

  // MARK: - Inherited

  override func viewDidLoad() {
    super.viewDidLoad()

    self.navigationItem.title = "Inline In-App Message implemented in XIB"
    self.view.backgroundColor = .white

    prepareBackButton()
    showInfo()

    self.inlineInAppViewWrapper?.delegate = self
  }

  // MARK: - Private

  private func showInfo() {
    if self.infoLabel.superview == nil {
      self.view.addSubview(self.infoLabel)
      NSLayoutConstraint.activate([
        self.infoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        self.infoLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        self.infoLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 16),
        self.infoLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor, constant: -16)
      ])
    }

    self.infoLabel.text = "`InlineInAppViewWrapper` should load Inline In-App Message here from XIB configuration (placementKey = single)."
    self.infoLabel.isHidden = false
    self.view.bringSubviewToFront(self.infoLabel)
  }

  private func removeInfo() {
    if self.infoLabel.superview != nil {
      self.infoLabel.removeFromSuperview()
    }
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
}

// MARK: - InlineInAppViewDelegate

extension TestXibWrapperForInlineInAppMessageViewController: InlineInAppViewDelegate {
  func snr_inlineInAppViewDidLoad(view: InlineInAppView, data: InlineInAppMessageData) {
    removeInfo()
  }

  func snr_inlineInAppViewDidFail(view: InlineInAppView, error: NSError) {
    removeInfo()
    showError(error)
  }
}
