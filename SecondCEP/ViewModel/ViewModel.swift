//
//  ViewModel.swift
//  SecondCEP
//
//  Created by The App Experts on 05/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    private(set) var fileName:String?// = "Accounts"
    private(set) var fileExtension:String?// = "json"
    private(set) var fileHelper:LocalFileHelper?
    private(set) var apiHelper:RestApiHelper?
    private(set) var accountsList:[Account]?
    
    override init() {
        super.init()
    }
    
    required init (apiHelper:RestApiHelper) {
        super.init()
        self.apiHelper = apiHelper
        
        self.fetchAccountsFromAPI()
    }
    
    required init(localFileHelper:LocalFileHelper, file:String) {
        super.init()
        self.fileHelper = localFileHelper
        
        self.setFileVariables(file: file)
        
        self.fetchAccountsFromFile()
    }
    
    func setFileVariables(file:String) {
        let fileFullName = file.split(separator: ".")
        if !fileFullName.isEmpty {
            self.fileName = String(fileFullName[0])
            self.fileExtension = String(fileFullName[1])
        }
    }
    
    func fetchAccountsFromAPI() {
        guard let url = apiHelper?.setURL(from: "https", host: "my-json-server.typicode.com", path: "/szarleydwarf/secondCEP/master/db/accounts") else {return}
        apiHelper?.fetch(from: url) { done in
            print("Done \(done)")
        }
    }
    
    
    func fetchAccountsFromFile() {
        if let fileHelper = self.fileHelper, let name = fileName, let fExtension = fileExtension {
            if let accounts = fileHelper.fetch(from: name, with: fExtension) {
                self.accountsList = accounts.isEmpty ? [] : accounts
            }
        }
    }
    
    func currencySymbol(from currencyCode:String?) -> String {
        guard let code = currencyCode else {return ""}
        let symbol = Locale.availableIdentifiers.map { Locale(identifier: $0) }.first { $0.currencyCode == code }
        guard let currSymbol = symbol?.currencySymbol else {return code}
        return currSymbol
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
