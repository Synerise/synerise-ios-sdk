//
//  DefaultNavigationBar.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import Foundation

class DefaultNavigationBar: UINavigationBar {
  // MARK: Init

  override init(frame: CGRect) {
    super.init(frame: frame)

    initBar()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private

  private func initBar() {
    titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.black,
      NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)
    ]

    tintColor = UIColor.black
  }
}

extension UINavigationItem {
  func setAdaptiveTitle(_ text: String) {
    let label = UILabel()
    label.text = text
    label.textColor = .black
    label.font = .boldSystemFont(ofSize: 18)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    label.textAlignment = .center
    label.lineBreakMode = .byClipping
    label.sizeToFit()

    self.titleView = label
  }
}
