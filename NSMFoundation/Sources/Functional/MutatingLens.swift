//
//  MutatingLens.swift
//  NSMFoundation
//
//  Created by Marc Bauer on 08.12.18.
//  Copyright © 2018 Marc Bauer. All rights reserved.
//

import Foundation

// As seen in @mbrandonw's wonderful talk https://www.youtube.com/watch?v=QOIigosUNGU

public struct MutatingLens<A, B> {
  public let view: (A) -> B
  public let mutatingSet: (inout A, B) -> Void

  public init(view: @escaping (A) -> B, mutatingSet: @escaping (inout A, B) -> Void) {
    self.view = view
    self.mutatingSet = mutatingSet
  }

  public func set(_ whole: A, _ part: B) -> A {
    var result = whole
    self.mutatingSet(&result, part)
    return result
  }
}



extension MutatingLens {
  public init(keyPath: WritableKeyPath<A, B>) {
    self.init(
      view: { $0[keyPath: keyPath] },
      mutatingSet: { whole, part in whole[keyPath: keyPath] = part }
    )
  }
}
