//
//  EitherTests.swift
//  NSMFoundationTests
//
//  Created by Marc Bauer on 13.12.18.
//  Copyright © 2018 Marc Bauer. All rights reserved.
//

import NSMFoundation
import XCTest

final class EitherTests: XCTestCase {
  func testEither() {
    var e: Either<Int, String> = .left(10)

    XCTAssertEqual(e.left, 10)
    XCTAssertNil(e.right)
    XCTAssertEqual(e, Either<Int, String>.left(10))
    XCTAssertNotEqual(e, Either<Int, String>.left(11))
    XCTAssertNotEqual(e, Either<Int, String>.right("123"))
    XCTAssertTrue(e.isLeft)
    XCTAssertFalse(e.isRight)

    e = .right("123")

    XCTAssertEqual(e.right, "123")
    XCTAssertNil(e.left)
    XCTAssertEqual(e, Either<Int, String>.right("123"))
    XCTAssertNotEqual(e, Either<Int, String>.right("456"))
    XCTAssertNotEqual(e, Either<Int, String>.left(10))
    XCTAssertTrue(e.isRight)
    XCTAssertFalse(e.isLeft)
  }
}
