//
//  Observable.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

protocol Observer: AnyObject {
  func observableDidChange(_ observable: Observable, data: Any)
}

protocol Observable: AnyObject {
  var observers: [Observer] { get set }

  func addObserver(_ observer: Observer)
  func removeObserver(_ observer: Observer)
  func notifyObservers(_ data: Any)
}
