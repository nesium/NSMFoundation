//
//  Prism.swift
//  NSMFoundation
//
//  Created by Marc Bauer on 08.12.18.
//  Copyright © 2018 Marc Bauer. All rights reserved.
//

import Foundation

public struct Prism<A, B> {
  public let preview: (A) -> B?
  public let review: (B) -> A

  public init(preview: @escaping (A) -> B?, review: @escaping (B) -> A) {
    self.preview = preview
    self.review = review
  }
}
