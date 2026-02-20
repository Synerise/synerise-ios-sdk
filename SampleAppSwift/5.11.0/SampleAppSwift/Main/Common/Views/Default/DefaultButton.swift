//
//  DefaultButton.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

@IBDesignable
class DefaultButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable var circularButton: Bool = false {
        didSet {
            if circularButton {
                configureButton()
            }
        }
    }

  @IBInspectable var padding: CGFloat = 0 {
    didSet {
      self.contentEdgeInsets = UIEdgeInsets(top: self.padding, left: self.padding, bottom: self.padding, right: self.padding)
    }
  }

    // MARK: - Public
    
    public func animateTapping() {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.975, y: 0.975)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.2, animations: {
                            self.transform = CGAffineTransform.identity
                        })
        })
    }

  func setBackgroundColor(_ color: UIColor) {
    self.backgroundColor = color
  }

  func setTitleColorForAllStates(_ color: UIColor) {
      setTitleColor(color, for: .normal)
      setTitleColor(color, for: .highlighted)
      setTitleColor(color, for: .selected)
      setTitleColor(color, for: .disabled)
      setTitleColor(color, for: .focused)
  }

    // MARK: - private

    private func updateCornerRadius() {
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.cornerRadius
        self.layoutIfNeeded()
    }
    
    private func configureButton() {
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
        self.layoutIfNeeded()
    }
}
