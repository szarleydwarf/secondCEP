//
//  LocalFileHelperTest.swift
//  SecondCEPTests
//
//  Created by The App Experts on 09/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import XCTest
import Foundation
@testable import SecondCEP

class LocalFileHelperTest: XCTestCase {
    var lfh:LocalFileHelper!
    
    override func setUp() {
        lfh = LocalFileHelper()
    }
    
    override func tearDown() {
        lfh = nil
    }
    
    func test_NewLocalFileHelper_NotNil () {
        // Given
        
        // When
        let result = lfh
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_NewLFH_JSDecoderNotNil () {
        // Given
        
        // When
        let result = lfh.decoder
        // Then
        XCTAssertNotNil(result)
    }
    
    func test () {
        // Given
        let fileName = "Accounts"
        let fileExtension = "json"
        
        // When
        let result = lfh.fetch(from: fileName, with: fileExtension)
        // Then
        XCTAssertNotNil(result)
    }
}
