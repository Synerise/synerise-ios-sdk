//
//  SelectableButton.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2025 Synerise. All rights reserved.
//

import UIKit

@IBDesignable
class SelectableButton: DefaultButton {
  @IBInspectable var selectedInInterfaceBuilder: Bool = false {
    didSet {
      self.isSelected = self.selectedInInterfaceBuilder
      updateAppearance()
    }
  }

  override var isSelected: Bool {
    didSet {
      updateAppearance()
    }
  }

  override var isEnabled: Bool {
    didSet {
      updateAppearance()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }

  private func setup() {
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.lightGray.cgColor

    addTarget(self, action: #selector(toggleSelection), for: .touchUpInside)
    updateAppearance()
  }

  @objc private func toggleSelection() {
    self.isSelected.toggle()
  }

  private func updateAppearance() {
    if self.isEnabled == true {
      if self.isSelected == true {
        setBackgroundColor(.systemBlue)
        setTitleColorForAllStates(.white)
      } else {
        setBackgroundColor(.clear)
        setTitleColorForAllStates(.darkGray)
      }
    } else {
      setBackgroundColor(.lightGray)
      setTitleColorForAllStates(.darkGray)
    }
  }
}
