//
//  ClientGetPromotionsListTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

// swiftlint:disable:next type_name
class ClientGetPromotionsListTableViewController: DefaultTableViewController {
  @IBOutlet weak var setStatusesSwitch: UISwitch!
  @IBOutlet weak var statusActiveButton: UIButton!
  @IBOutlet weak var statusAssignedButton: UIButton!
  @IBOutlet weak var statusRedemeedButton: UIButton!

  @IBOutlet weak var setTypesSwitch: UISwitch!
  @IBOutlet weak var typeMembersOnlyButton: UIButton!
  @IBOutlet weak var typeCustomButton: UIButton!
  @IBOutlet weak var typeGeneralButton: UIButton!

  @IBOutlet weak var checkGlobalActivationLimitsSwitch: UISwitch!

  @IBOutlet weak var sortingMenuButton: UIButton!
  @IBOutlet weak var sortingSegmentedControl: UISegmentedControl!

  @IBOutlet weak var limitTextField: UITextField!
  @IBOutlet weak var pageTextField: UITextField!

  @IBOutlet weak var includeVouchersSwitch: UISwitch!
  @IBOutlet weak var includeMetaSwitch: UISwitch!

  // MARK: - IBAction / Actions

  @IBAction func getAllPromotionsList() {
    self.showLoading()
    Promotions.getPromotions(success: { (promotionResponse) in
      self.hideLoading()

      let debugInfoString = SyneriseModelStringRepresentation.makePromotionsListStringRepresentation(promotionResponse)
      self.pushDebugViewController(text: debugInfoString)
    }, failure: { (error) in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  @IBAction func getPromotionsListWithOptions() {
    let apiQuery = PromotionsApiQuery()

    if self.setStatusesSwitch.isOn == true {
      var statuses: [SNRPromotionStatusString] = [SNRPromotionStatusString]()

      if self.statusActiveButton.isSelected == true {
        statuses.append(SNR_PROMOTION_STATUS_ACTIVE)
      }

      if self.statusAssignedButton.isSelected == true {
        statuses.append(PromotionStatusString.assigned)
      }

      if self.statusRedemeedButton.isSelected == true {
        statuses.append(PromotionStatusString.redeemed)
      }

      apiQuery.statuses = statuses
    }

    if self.setTypesSwitch.isOn == true {
      var types: [String] = [String]()

      if self.typeMembersOnlyButton.isSelected == true {
        types.append(PromotionTypeString.membersOnly)
      }

      if self.typeCustomButton.isSelected == true {
        types.append(PromotionTypeString.custom)
      }

      if self.typeGeneralButton.isSelected == true {
        types.append(PromotionTypeString.general)
      }

      apiQuery.types = types
    }

    apiQuery.checkGlobalActivationLimits = self.checkGlobalActivationLimitsSwitch.isOn

    if let sorting = self.sortingMenuButton.titleLabel?.text, sorting.isEmpty == false, sorting != "<<NONE>>" {
      let sortingOrder = self.sortingSegmentedControl.selectedSegmentIndex == 0 ? SyneriseApiQuerySortingOrderString.asc : SyneriseApiQuerySortingOrderString.desc
      apiQuery.sorting = [
        [sorting as SNRPromotionSortingKey: sortingOrder as SNRApiQuerySortingOrderString]
      ]
    }

    if let limit = self.limitTextField.text, limit.isEmpty == false, let limitValue = Int(limit) {
      apiQuery.limit = limitValue
    }

    if let page = self.pageTextField.text, page.isEmpty == false, let pageValue = Int(page) {
      apiQuery.page = pageValue
    }

    apiQuery.includeVouchers = self.includeVouchersSwitch.isOn
    apiQuery.includeMeta = self.includeMetaSwitch.isOn

    self.showLoading()
    Promotions.getPromotions(apiQuery: apiQuery, success: { (promotionResponse) in
      self.hideLoading()

      let debugInfoString = SyneriseModelStringRepresentation.makePromotionsListStringRepresentation(promotionResponse)
      self.pushDebugViewController(text: debugInfoString)
    }, failure: { (error) in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  @objc private func setStatusesSwitchValueChanged(_ sender: UISwitch) {
    updateStatusesButtons()
  }

  @objc private func setTypesSwitchValueChanged(_ sender: UISwitch) {
    updateTypesButtons()
  }

  // MARK: - Lifecycle
    
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "\("VIEW_CONTROLLER_PROMOTIONS_API_TITLE".localized()) / Get Promotions"

    setup()
    setDefaultSettingsForControls()
  }
    
  // MARK: - Private

  private func setup() {
    self.setStatusesSwitch.addTarget(self, action: #selector(setStatusesSwitchValueChanged(_:)), for: .valueChanged)
    self.setTypesSwitch.addTarget(self, action: #selector(setTypesSwitchValueChanged(_:)), for: .valueChanged)

    prepareSortingMenu()
  }

  private func setDefaultSettingsForControls() {
    self.setStatusesSwitch.isOn = true
    self.statusActiveButton.isSelected = false
    self.statusAssignedButton.isSelected = false
    self.statusRedemeedButton.isSelected = false

    self.setTypesSwitch.isOn = true
    self.typeMembersOnlyButton.isSelected = false
    self.typeCustomButton.isSelected = false
    self.typeGeneralButton.isSelected = false

    self.checkGlobalActivationLimitsSwitch.isOn = true
    self.sortingMenuButton.setTitle("<<NONE>>", for: .normal)
    self.sortingSegmentedControl.isHidden = true
    self.limitTextField.text = "100"
    self.pageTextField.text = "1"
    self.includeVouchersSwitch.isOn = false
    self.includeMetaSwitch.isOn = false

    updateStatusesButtons()
    updateTypesButtons()
  }

  private func prepareSortingMenu() {
    let noneAction = UIAction(title: "<<NONE>>", image: nil) { _ in
      self.updateSorting("<<NONE>>")
    }
    let action1 = UIAction(title: PromotionSortingKey.expireAt, image: nil) { _ in
      self.updateSorting(PromotionSortingKey.expireAt)
    }
    let action2 = UIAction(title: PromotionSortingKey.createdAt, image: nil) { _ in
      self.updateSorting(PromotionSortingKey.createdAt)
    }
    let action3 = UIAction(title: PromotionSortingKey.lastingAt, image: nil) { _ in
      self.updateSorting(PromotionSortingKey.lastingAt)
    }
    let action4 = UIAction(title: PromotionSortingKey.requireRedeemedPoints, image: nil) { _ in
      self.updateSorting(PromotionSortingKey.requireRedeemedPoints)
    }
    let action5 = UIAction(title: PromotionSortingKey.updatedAt, image: nil) { _ in
      self.updateSorting(PromotionSortingKey.updatedAt)
    }
    let action6 = UIAction(title: PromotionSortingKey.type, image: nil) { _ in
      self.updateSorting(PromotionSortingKey.type)
    }
    let action7 = UIAction(title: PromotionSortingKey.priority, image: nil) { _ in
      self.updateSorting(PromotionSortingKey.priority)
    }

    let menu = UIMenu(title: "Sorting Key", children: [noneAction, action1, action2, action3, action4, action5, action6, action7])

    self.sortingMenuButton.menu = menu
    self.sortingMenuButton.setTitle("<<NONE>>", for: .normal)
    self.sortingMenuButton.showsMenuAsPrimaryAction = true
  }

  private func updateStatusesButtons() {
    self.statusActiveButton.isEnabled = self.setStatusesSwitch.isOn
    self.statusAssignedButton.isEnabled = self.setStatusesSwitch.isOn
    self.statusRedemeedButton.isEnabled = self.setStatusesSwitch.isOn
  }

  private func updateTypesButtons() {
    self.typeMembersOnlyButton.isEnabled = self.setTypesSwitch.isOn
    self.typeCustomButton.isEnabled = self.setTypesSwitch.isOn
    self.typeGeneralButton.isEnabled = self.setTypesSwitch.isOn
  }

  private func updateSorting(_ sortingKey: String) {
    self.sortingMenuButton.setTitle(sortingKey, for: .normal)
    self.sortingSegmentedControl.isHidden = sortingKey == "<<NONE>>"
  }
}
