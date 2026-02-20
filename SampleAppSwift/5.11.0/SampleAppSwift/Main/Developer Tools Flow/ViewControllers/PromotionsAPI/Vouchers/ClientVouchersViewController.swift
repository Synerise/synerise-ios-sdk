//
//  ClientVouchersViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientVouchersViewController: DefaultViewController {

  // MARK: - IBAction / Actions

  @IBAction func getAssignedVoucherCodesButtonWasPressed(_ sender: UIButton) {
    showLoading()

    Promotions.getAssignedVoucherCodes(success: { (voucherCodesResponse) in
      self.hideLoading()

      let debugInfoString = self.makeVoucherStringRepresentation(voucherCodesResponse)
      self.pushDebugViewController(text: debugInfoString)
    }, failure: { (error) in
      self.hideLoading()
      self.showErrorInfo(error as NSError)
    })
  }

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = "\("VIEW_CONTROLLER_PROMOTIONS_API_TITLE".localized()) / Vouchers"

    prepareBackButton()
  }

  private func makeVoucherStringRepresentation(_ response: VoucherCodesResponse) -> String {
    var promotionStringRepresentation: String = ""

    for voucher in response.items {
      let code = voucher.code
      let status = voucher.status.toString()
      let clientId = voucher.clientId
      let clientUuid = voucher.clientUuid ?? "nil"
      let poolUuid = voucher.poolUuid
      let expireIn = voucher.expireIn?.description ?? "nil"
      let redeemAt = voucher.redeemAt?.description ?? "nil"
      let assignedAt = voucher.assignedAt?.description ?? "nil"
      let createdAt = voucher.createdAt.description
      let updatedAt = voucher.updatedAt.description

      promotionStringRepresentation += """
      code: \(code)
      status: \(status)
      clientID: \(clientId)
      clientUUID: \(clientUuid)
      poolUUID: \(poolUuid)
      expireIn: \(expireIn)
      redeemAt: \(redeemAt)
      assignedAt: \(assignedAt)
      createdAt: \(createdAt)
      updatedAt: \(updatedAt)
      """
    }

    return promotionStringRepresentation
  }
}
