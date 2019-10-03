//
//  Lens.swift
//  NSMFoundation
//
//  Created by Marc Bauer on 08.12.18.
//  Copyright © 2018 Marc Bauer. All rights reserved.
//

import Foundation

// As seen in @mbrandonw's wonderful talk https://www.youtube.com/watch?v=QOIigosUNGU

public struct Lens<A, B> {
  public let view: (A) -> B
  public let set: (B) -> (A)

  public init(view: @escaping (A) -> B, set: @escaping (B) -> (A)) {
    self.view = view
    self.set = set
  }
}
