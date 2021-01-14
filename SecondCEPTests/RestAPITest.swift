//
//  RestAPITest.swift
//  SecondCEPTests
//
//  Created by The App Experts on 14/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import XCTest

class RestAPITest: XCTestCase {
    private var rapi = RestApiHelper!
    
    override func setUp() {
        self.rapi = RestApiHelper(decoder: JSONDecoder())
    }

    override func tearDown() {
        rapi = nil
    }

}
