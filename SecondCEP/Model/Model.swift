//
//  Model.swift
//  SecondCEP
//
//  Created by The App Experts on 05/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

struct AccountsList: Decodable {
    let accountsList:[Account]?
}

struct Account: Decodable {
    let kind:String//, title, number, currency: String?
//    let balance: Double?
}
