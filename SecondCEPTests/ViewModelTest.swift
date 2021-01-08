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
    
    func test_NewVMAccountList_isNotNil() {
        // Given
        
        // When
        let result = viewModel.accountsList
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_NewVMFileManager_NotNil () {
        // Given
        
        // When
        let result = viewModel.fileHelper
        // Then
        XCTAssertNotNil(result)
    }
    
    func test_VMcurrencySymbol_notEmpty () {
        // Given
        
        // When
        let result = viewModel.currencySymbol(from: "USD")
        // Then
        XCTAssertEqual(result, "$")
    }
    
    func test_VMcurrencySymbol_isEmpty () {
        // Given
        
        // When
        let result = viewModel.currencySymbol(from: nil)
        // Then
        XCTAssertEqual(result, "")
    }
    
    
    func test_NewVM_UnwrapedAccountList_isNotEmpty () throws {
        // Given
        // When
        let result = try XCTUnwrap(viewModel.accountsList)
        // Then
        XCTAssertFalse(result.isEmpty)
    }
}
