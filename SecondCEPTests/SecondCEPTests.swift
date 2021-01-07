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
    /*
     "kind": "current",
     "title": "Joint Account",
     "number": "NL25 TRIO 0269 8445 60",
     "balance": 1500.20,
     "currency": "USD"
     */
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
    
    func test_NewModelKind_isEmpty () {
        // Given new model
        // When
        let result = account.kind
        // Then is nil
        XCTAssert(result!.isEmpty)
    }

    func test_NewModelTitle_isEmpty () {
        // Given new model
        // When
        let result = account.title
        // Then is nil
        XCTAssert(result!.isEmpty)
    }
    
    func test_NewModelNumber_isEmpty () {
        // Given new model
        // When
        let result = account.number
        // Then is nil
        XCTAssert(result!.isEmpty)
    }
    
    func test_NewModelcurrency_isEmpty () {
        // Given new model
        // When
        let result = account.currency
        // Then is nil
        XCTAssert(result!.isEmpty)
    }

    func test_NewModelBalance_isZero () {
        // Given new model
        // When
        let result = account.balance
        // Then is nil
        XCTAssertEqual(result, 0)
    }

    func test_ModelKind_isCurrent () {
        // Given new model
        account.kind = "current"
        // When
        let result = account.kind
        // Then is nil
        XCTAssertEqual(result, "current")
    }
    
    func test_ModelTitle_isJointAccount () {
        // Given new model
        account.title = "Joint Account"
        // When
        let result = account.title
        // Then is nil
        XCTAssertEqual(result, "Joint Account")
    }

    func test_ModelNumber_isNL25TRIO0269844560 () {
        // Given new model
        account.number = "NL25 TRIO 0269 8445 60"
        // When
        let result = account.number
        // Then is nil
        XCTAssertEqual(result, "NL25 TRIO 0269 8445 60")
    }

    func test_ModelCurrency_isUSD () {
        // Given new model
        account.currency = "USD"
        // When
        let result = account.currency
        // Then is nil
        XCTAssertEqual(result, "USD")
    }

    func test_ModelBalance_isGreaterThanZero () {
        // Given new model
        account.balance = 1
        // When
        if let balance = account.balance{
            let result = balance > 0 ? true : false
        // Then is nil
            XCTAssertTrue(result)
        }
    }
    
    func test_ModelBalance_isFifteenHoundretsAndTwentyCents () {
        // Given new model
        account.balance = 1500.20
        // When
        let result = account.balance
        // Then is nil
        XCTAssertEqual(result, 1500.20)
    }

}
