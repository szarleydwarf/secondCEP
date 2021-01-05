//
//  Model.swift
//  SecondCEP
//
//  Created by The App Experts on 05/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

struct AccountsList {
    let accountsList:[Account]
}

struct Account {
    let kind:String
    let title:String
    let number:String
    let balance:Int
    let currency:String
}
