//
//  LocalFileHelper.swift
//  SecondCEP
//
//  Created by The App Experts on 06/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import Foundation

class LocalFileHelper {
    private(set) var decoder:JSONDecoder
    init(decoder: JSONDecoder) {
        self.decoder = decoder
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetch(from fileName:String, with fileExtension:String) -> [Account]? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {return nil}
        guard let data = try? Data(contentsOf: url) else {return nil}
        
        guard let json = try? decoder.decode([Account].self, from: data) else { return nil}
//            print("json \(json)")
            return json
    }
}
