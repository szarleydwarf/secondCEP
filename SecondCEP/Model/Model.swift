//
//  Model.swift
//  SecondCEP
//
//  Created by The App Experts on 05/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

struct Account: Decodable {
    let kind, title, number, currency: String?
    let balance: Double?
}
