//
//  Monoid.swift
//  NSMFoundation
//
//  Created by Marc Bauer on 08.12.18.
//  Copyright © 2018 Marc Bauer. All rights reserved.
//

import Foundation

precedencegroup MonoidAppend {
  associativity: left
}

infix operator <>: MonoidAppend

public protocol Monoid {
  static var empty: Self { get }
  static func <> (lhs: Self, rhs: Self) -> Self
}
