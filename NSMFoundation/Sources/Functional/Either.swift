//
//  Either.swift
//  NSMFoundation
//
//  Created by Marc Bauer on 22.01.18.
//  Copyright © 2018 nesiumdotcom. All rights reserved.
//

import Foundation

public enum Either<L, R> {
  case left(L)
  case right(R)
}

extension Either {
  public var left: L? {
    guard case let .left(value) = self else {
      return nil
    }
    return value
  }

  public var right: R? {
    guard case let .right(value) = self else {
      return nil
    }
    return value
  }

  public var isLeft: Bool {
    switch self {
      case .left:
        return true
      case .right:
        return false
    }
  }

  public var isRight: Bool {
    switch self {
      case .left:
        return false
      case .right:
        return true
    }
  }
}

extension Either: Equatable where L: Equatable, R: Equatable {
  public static func ==(lhs: Either, rhs: Either) -> Bool {
    switch (lhs, rhs) {
      case let (.left(lhs), .left(rhs)):
        return lhs == rhs
      case let (.right(lhs), .right(rhs)):
        return lhs == rhs
      default:
        return false
    }
  }
}
