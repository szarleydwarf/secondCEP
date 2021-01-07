//
//  ViewModelTest.swift
//  SecondCEPTests
//
//  Created by The App Experts on 07/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import XCTest
@testable import SecondCEP

class ViewModelTest: XCTestCase {
    var viewModel:ViewModel!
    
    override func setUp() {
        viewModel = ViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func test_NewVM_isNotNil () {
        // Given
        
        // When
        let result = viewModel
        // Then
        XCTAssertNotNil(result)
    }
    
    func testNewVMAccountList_isNotNil() {
        // Given
        
        // When
        let result = viewModel.accountsList
        // Then
        XCTAssertNotNil(result)
    }
    
    
}
