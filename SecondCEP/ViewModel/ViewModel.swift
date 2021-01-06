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
    var accountsList:AccountsList?
    
    override init() {
        super.init()
        self.fileHelper = LocalFileHelper()
        self.fetchAccountsFromFile()
    }
    
    func getAccountsList() -> AccountsList? {
        return accountsList
    }
    
    func fetchAccountsFromFile() {
        if let fileHelper = self.fileHelper {
            self.accountsList = fileHelper.fetch(from: fileName, with: fileExtension)
        }
    }
}
