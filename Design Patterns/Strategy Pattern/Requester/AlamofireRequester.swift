//
//  AlamofireRequester.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/6/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireRequester: Requester {
    func getData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        debugPrint("making request with alamofire")
        
        Alamofire.request(url).response(completionHandler: { dataResponse in
                completion(dataResponse.data, dataResponse.error)
        })
        
    }
}
