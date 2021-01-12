//
//  RestApiHelper.swift
//  SecondCEP
//
//  Created by The App Experts on 12/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//"/szarleydwarf/secondCEP/master/db/accounts"

import Foundation

class RestApiHelper {
    private(set) var decoder:JSONDecoder
    var url:URL?
    init() {
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    
    func setURL(from scheme:String, host:String, path:String){
        var components = URLComponents()
          components.scheme = scheme
          components.host = host
          components.path = path
        guard let url = components.url else {return}
        self.url = url
    }

    
    public func fetch(from url:URL?, completion:@escaping(Bool)->Void) {
        
        
        
        DispatchQueue.main.async {
            completion(true)
        }
    }
}
