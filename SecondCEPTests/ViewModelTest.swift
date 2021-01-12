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
        let lfh = LocalFileHelper()
        let name = "Accounts.json"
        viewModel = ViewModel(localFileHelper: lfh, file: name)
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
    
    func test_VMcurrencySymbol_isEmpty () {
        // Given
        
        // When
        let result = viewModel.currencySymbol(from: nil)
        // Then
        XCTAssertTrue(result.isEmpty)
    }
    
    func test_VMcurrencySymbol_notEmpty () {
        // Given
        
        // When
        let result = viewModel.currencySymbol(from: "USD")
        // Then
        XCTAssertFalse(result.isEmpty)
    }
    
    func test_VMCurrencySymbolUSD_is$ () {
        // given
        let symbol = "£"
        let code = "GBP"
        // when
        let result = viewModel.currencySymbol(from: code)
        // then
        XCTAssertEqual(result, symbol)
    }
    
    func test_NewVM_UnwrapedAccountList_isNotEmpty () throws {
        // Given
        // When
        let result = try XCTUnwrap(viewModel.accountsList)
        // Then
        XCTAssertFalse(result.isEmpty)
    }
    
    func test_VMStringPrepareFunc_returnNotEmptyString () {
        // Given
        let listOfStrings:[String] = ["hi", "ola", "hey"]
        // When
        let result = viewModel.prepareString(from: listOfStrings)
        // Then
        XCTAssertFalse(result.isEmpty)
    }
    
    func test_VMStringPrepareFunc_returnEmptyString () {
        // Given
        let listOfStrings:[String] = []
        // When
        let result = viewModel.prepareString(from: listOfStrings)
        print(result)
        // Then
        XCTAssertTrue(result.isEmpty)
    }
    
    func test_VMFormatBalance_returnEmtyString () {
        // given
        
        // when
        let result = viewModel.formatBlance(from: nil)
        // then
        XCTAssertTrue(result.isEmpty)
    }
    
    func test_VMFormatBalance_isTen () {
        // given
        let balance = 10.00001
        // when
        let result = viewModel.formatBlance(from: balance)
        // then
        XCTAssertEqual(result, " 10.00")
    }
}
