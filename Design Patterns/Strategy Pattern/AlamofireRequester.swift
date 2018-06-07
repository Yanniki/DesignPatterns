//
//  AlamofireRequester.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/6/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class AlamofireRequester: Requester {

    let decoder: JSONDecoder
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func get<T>(from url: URL, completion: @escaping (T?, Error?) -> Void) where T : Codable {
        Alamofire.request(url).response { [weak self] (response) in
            guard let data = response.data else {
                completion(nil, response.error)
                return
            }
            
            do {
                let parsedResult = try self?.decoder.decode(T.self, from: data)
                
                debugPrint("fetched with Alamofire")
                completion(parsedResult, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
    
    func getImage(from url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        Alamofire.request(url).response { (response) in
            guard let data = response.data else {
                completion(nil, response.error)
                return
            }
            
            debugPrint("fetched with Alamofire")
            completion(UIImage(data: data), nil)
        }
    }
}
