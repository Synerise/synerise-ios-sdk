//
//  CategoriesListViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class CategoriesListViewController: DefaultViewController {
  var viewModel: CategoriesListViewModel!

  let rowHeight: CGFloat = 200.0

  @IBOutlet var SDKDebugPlaceholderView: UIView!
  @IBOutlet var tableView: UITableView!

  private var activityIndicatorView: UIActivityIndicatorView?

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setSDKDebugPlaceholderView()
    prepareRightCartButton()
    setup()
  }

  // MARK: - Private

  private func setup() {
    tableView.delegate = self
    tableView.dataSource = self
    let nib = UINib(nibName: "CategoryItemTableViewCell", bundle: nil)
    self.tableView.register(nib, forCellReuseIdentifier: CategoryItemTableViewCell.reuseIdentifier)
    self.navigationItem.title = viewModel.sectionModel.sectionName
  }

  private func setSDKDebugPlaceholderView() {
    if let component = Injector.createInlineInAppView(placementKey: "categoriesListPlaceholder") {
      component.delegate = self
      component.translatesAutoresizingMaskIntoConstraints = false

      self.SDKDebugPlaceholderView.addSubview(component)
      let widthConstraint = component.widthAnchor.constraint(equalTo: self.SDKDebugPlaceholderView.widthAnchor)
      let heightConstraint = component.heightAnchor.constraint(equalTo: self.SDKDebugPlaceholderView.heightAnchor)

      NSLayoutConstraint.activate([
        component.topAnchor.constraint(equalTo: self.SDKDebugPlaceholderView.topAnchor),
        component.leadingAnchor.constraint(equalTo: self.SDKDebugPlaceholderView.leadingAnchor),
        widthConstraint,
        heightConstraint
      ])

      showActivityIndicator(in: component)
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

extension CategoriesListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let index = indexPath.row
    viewModel.categoryWasSelected(index: index)
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfItems()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryItemTableViewCell.reuseIdentifier) as? CategoryItemTableViewCell else {
      fatalError("Cannot dequeue cell")
    }
    let index = indexPath.row
    let itemViewModel = viewModel.getItemViewModel(index: index)
    cell.update(itemViewModel)

    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return rowHeight
  }
}

// MARK: - InlineInAppViewDelegate

extension CategoriesListViewController: InlineInAppViewDelegate {
  func snr_inlineInAppViewDidLoad(view: InlineInAppView, data: InlineInAppMessageData) {
    hideActivityIndicator()
  }

  func snr_inlineInAppViewShouldBeRemoved(view: InlineInAppView, data: InlineInAppMessageData) {
    hideActivityIndicator()
    self.SDKDebugPlaceholderView.subviews.first!.removeFromSuperview()
    self.SDKDebugPlaceholderView.heightAnchor.constraint(equalToConstant: 0).isActive = true
  }
}
