//
//  ProductsListViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import SyneriseSDK

class ProductsListViewModel {
  var coordinator: ShopCoordinator?

  var category: Category?

  var productModels: [Product]?
  var productItemCollectionViewModels: [ProductItemCollectionViewModel] = .init()

  var isLoading: ObservingType<Bool> = ObservingType(false)

  var onUpdateRequired: (() -> Void)?

  // MARK: - Init

  init(category: Category) {
    self.category = category
  }

  // MARK: - Public

  func fetchProducts() {
    guard let category = self.category else {
      return
    }

    if category.identificator == CategoryDataSource.CategoryIdentity.promotions.rawValue {
      populatePromotionsProducts()
    } else {
      populateProducts()
    }
  }

  func getItemViewModel(index: Int) -> ProductItemCollectionViewModel {
    return productItemCollectionViewModels[index]
  }

  func numberOfItems() -> Int {
    return productItemCollectionViewModels.count
  }

  func productWasSelected(index: Int) {
    guard let productModels = productModels else { return }
    coordinator?.productWasSelected(product: productModels[index])
  }

  // MARK: - Private

  private func populateProducts() {
    guard let category = category, let productModels = ProductDataSource.getProducts(categoryId: category.identificator) else { return }
    self.productModels = productModels
    productsDidUpdate()
  }

  private func populatePromotionsProducts() {
    isLoading.value = true

    Promotions.getPromotions(success: { promotionResponse in
      var productModels = [Product]()

      for promotion in promotionResponse.items {
        guard
          let productDescription = promotion.descriptionText,

          let productImage = promotion.images?.first

        else {
          continue
        }

        let productName = promotion.name
        let productImageURLString = productImage.url
        let productImageURL = URL(string: productImageURLString)!

        var productDiscountDescription: String!
        switch promotion.discountType {
        case .percent: productDiscountDescription = promotion.discountValue.stringValue + "%"
        case .amount: productDiscountDescription = promotion.discountValue.stringValue + "$"
        default: productDiscountDescription = ""
        }

        let productPrice = promotion.price.doubleValue / 100

        let product = Product(brand: productDiscountDescription, name: productName, sku: "-", description: productDescription, imageURL: productImageURL, price: productPrice, rating: 0, ratingCount: 0, categories: "promotions")
        product.isPromotion = true
        productModels.append(product)
      }

      self.productModels = productModels
      self.isLoading.value = false
      self.productsDidUpdate()
    }) { error in
      self.productModels = []
      self.isLoading.value = false
      self.productsDidUpdate()
    }
  }

  private func productsDidUpdate() {
    guard
      let category = self.category,
      let productModels = self.productModels
    else {
      return
    }

    for product in productModels {
      let productItemCollectionViewModel = ProductItemCollectionViewModel(product: product)

      if category.identificator == CategoryDataSource.CategoryIdentity.promotions.rawValue {
        productItemCollectionViewModel.isPriceVisible = false
      }

      productItemCollectionViewModels.append(productItemCollectionViewModel)
    }

    onUpdateRequired?()
  }
}
