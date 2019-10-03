//
//  Function.swift
//  NSMFoundation
//
//  Created by Marc Bauer on 08.12.18.
//  Copyright © 2018 Marc Bauer. All rights reserved.
//

import Foundation

public func const <A, B> (_ b: B) -> ((A) -> B) {
  return { _ in b }
}

public func passthrough<T>(_ value: T) -> T {
  return value
}
