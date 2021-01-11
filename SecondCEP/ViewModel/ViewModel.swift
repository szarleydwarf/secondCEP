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
    private(set) var fileHelper:LocalFileHelper?
    private(set) var accountsList:[Account]?
    
    override init() {
        super.init()
        self.fileHelper = LocalFileHelper()
        
        self.fetchAccountsFromFile()
    }
    
    func fetchAccountsFromFile() {
        if let fileHelper = self.fileHelper {
            if let accounts = fileHelper.fetch(from: fileName, with: fileExtension) {
                self.accountsList = accounts.isEmpty ? [] : accounts
            }
        }
    }
    
    func currencySymbol(from currencyCode:String?) -> String {
        guard let code = currencyCode else {return ""}
        return code
    }
    
    func prepareString(from listOfStrings:[String?]) -> String {
        var stringToReturn:String = ""
        listOfStrings.forEach{
            guard let stringToAppend = $0 else {return}
            stringToReturn.append(_: " \(stringToAppend)")
        }
        return stringToReturn
    }
    
    func formatBlance(from balance:Double?) -> String {
        guard let balanceUnwraped = balance else {return ""}
        return String(format: " %.2f", locale: Locale.current, balanceUnwraped)
    }
}
