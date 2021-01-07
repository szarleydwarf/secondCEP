//
//  ViewModel.swift
//  SecondCEP
//
//  Created by The App Experts on 05/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation
//listInTable
class ViewModel: NSObject {
    private let fileName = "Accounts"
    private let fileExtension = "json"
    private var fileHelper:LocalFileHelper?
    private(set) var accountsList:[Account]?
    
    override init() {
        super.init()
        self.fileHelper = LocalFileHelper()
        
        self.fetchAccountsFromFile()
    }
    
    func fetchAccountsFromFile() {
        if let fileHelper = self.fileHelper {
            self.accountsList = fileHelper.fetch(from: fileName, with: fileExtension)
        }
    }
    
    func currencySymbol(from currencyCode:String?) -> String {
        if let currency = currencyCode {
            let result = Locale.availableIdentifiers.map { Locale(identifier: $0) }.first { $0.currencyCode == currency }
            if let symbol = result?.currencySymbol {
                return symbol
            }
        }
        return ""
    }
}
