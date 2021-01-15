//
//  RestAPITest.swift
//  SecondCEPTests
//
//  Created by The App Experts on 14/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import XCTest
@testable import SecondCEP

class RestAPITest: XCTestCase {
    private var rapi: RestApiHelper!
    
    override func setUp() {
        rapi = RestApiHelper(decoder: JSONDecoder())
    }
    
    override func tearDown() {
        rapi = nil
    }
    
    func test_NewRAPIeHelper_NotNil () {
        // Given
        
        // When
        let result = rapi
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_NewRAPIH_JSDecoderNotNil () {
        // Given
        
        // When
        let result = rapi.decoder
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_RAH_URL_isNil () {
        // given
        
        // when
        let result = rapi.setURL(from: "", host: "", path: "")
        // then
        XCTAssertNil(result)
    }
    
    func test_RAH_URL_isNotNil () {
        // given
        
        // when
        let result = rapi.setURL(from: "https", host: "my-json-server.typicode.com", path: "/szarleydwarf/secondCEP/master/db/accounts")
        // then
        XCTAssertNotNil(result)
    }
    
    func test_RAH_URL_isURLEqualTestURL () {
        // given
        let url = URL(string:  "https://my-json-server.typicode.com/szarleydwarf/secondCEP/master/db/accounts")
        // when
        let result = rapi.setURL(from: "https", host: "my-json-server.typicode.com", path: "/szarleydwarf/secondCEP/master/db/accounts")
        // then
        XCTAssertEqual(result, url)
    }
    
    func test_FetchNilURL_CompletionFalse () {
        // given
        rapi.fetch(from: nil) {completed, json in
            // then
            XCTAssertFalse(completed)
        }
    }
    
    
    func test_FetchEmptyURL_CompletionFalse () {
        // given
        let url = URL(string:"")
        //when
        let expectation = self.expectation(description: "false")
        var result = false
        rapi.fetch(from: url) {completed, json in
            // then
            print("1 \(completed) \(result)")
            result = completed
            print("2 \(completed) \(result)")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15)
        XCTAssertFalse(result)
    }
    
    func test_FetchURL_CompletionTrue () {
        // given
        let url = URL(string:  "https://my-json-server.typicode.com/szarleydwarf/secondCEP/master/db/accounts")
        let expectation = self.expectation(description: "true")
        // when
        var result = false
        rapi.fetch(from: url) {completed, json in
            // then
            result = completed
            expectation.fulfill()
        }
        waitForExpectations(timeout: 15)
        XCTAssertTrue(result)
    }
}
