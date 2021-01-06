//
//  LocalFileHelper.swift
//  SecondCEP
//
//  Created by The App Experts on 06/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

class LocalFileHelper {
    private var decoder:JSONDecoder
    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetch(from fileName:String, with fileExtension:String) -> AccountsList? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {return nil}
        guard let data = try? Data(contentsOf: url) else {return nil}
        
        if let json = try? decoder.decode(Account.self, from: data) {
            print("json \(json)")
//            return json
        }
        
        return nil
    }
}
