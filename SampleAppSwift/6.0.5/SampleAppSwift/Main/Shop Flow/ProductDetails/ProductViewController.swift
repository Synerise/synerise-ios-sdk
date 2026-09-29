//
//  ProductViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ProductViewController: DefaultViewController {
  var viewModel: ProductViewModel!

  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var stackView: UIStackView!
  @IBOutlet var productDetailsView: ProductDetailsView! {
    didSet {
      productDetailsView.setViewModel(viewModel.productDetailsViewModel!)
      productDetailsView.delegate = viewModel.productDetailsViewModel
    }
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    prepareRightCartButton()
  }
}
