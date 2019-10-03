//
//  DispatchQueue+Bindings.swift
//  NSMFoundation
//
//  Created by Marc Bauer on 08.12.18.
//  Copyright © 2018 Marc Bauer. All rights reserved.
//

import Dispatch

extension DispatchQueue {
  // via https://github.com/ReactiveX/RxSwift/blob/0b66f666ba6955a51cba1ad530311b030fa4db9c/Platform/DispatchQueue%2BExtensions.swift

  private static var token: DispatchSpecificKey<()> = {
    let key = DispatchSpecificKey<()>()
    DispatchQueue.main.setSpecific(key: key, value: ())
    return key
  }()

  public static var nsm_isMain: Bool {
    return DispatchQueue.getSpecific(key: token) != nil
  }

  public static func nsm_asyncOnMainThread(execute block: @escaping () -> ()) {
    guard !DispatchQueue.nsm_isMain else {
      block()
      return
    }
    DispatchQueue.main.async(execute: block)
  }

  public static func nsm_syncOnMainThread<T>(execute block: () -> T) -> T {
    guard !DispatchQueue.nsm_isMain else {
      return block()
    }
    return DispatchQueue.main.sync(execute: block)
  }
}
