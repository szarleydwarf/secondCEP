//
//  SecondCEPTests.swift
//  SecondCEPTests
//
//  Created by The App Experts on 05/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import XCTest
@testable import SecondCEP

class SecondCEPTests: XCTestCase {
    var account:Account!
    
    override func setUp() {
        account = Account(kind: "",title: "",number: "",currency: "",balance: 0.0)
    }

    override func tearDown() {
        account = nil
    }

    func test_Model_isNotNil () {
        // Given new model
        // When
        let result = account
        // Then is nil
        XCTAssertNotNil(result)
    }
    
    func test_NewModelKind_isEmpty() {
        // Given new model
        // When
        let result = account.kind
        // Then is nil
        XCTAssert(result!.isEmpty)
    }

    func test_NewModelTitle_isEmpty() {
        // Given new model
        // When
        let result = account.title
        // Then is nil
        XCTAssert(result!.isEmpty)
    }
    
    func test_NewModelNumber_isEmpty() {
        // Given new model
        // When
        let result = account.number
        // Then is nil
        XCTAssert(result!.isEmpty)
    }
    
    func test_NewModelcurrency_isEmpty() {
        // Given new model
        // When
        let result = account.currency
        // Then is nil
        XCTAssert(result!.isEmpty)
    }

    func test_NewModelBalance_isZero() {
        // Given new model
        // When
        let result = account.balance
        // Then is nil
        XCTAssertEqual(result, 0)
    }

    func test_ModelKind_isCurrent() {
        // Given new model
        account.kind = "current"
        // When
        let result = account.kind
        // Then is nil
        XCTAssertEqual(result, "current")
    }

}
