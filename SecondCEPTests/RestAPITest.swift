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
    

}
