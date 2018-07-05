//
//  AlamofireRequester.swift
//  Design Patterns
//
//  Created by Ioannis Pasmatzis on 5/6/18.
//  Copyright © 2018 Yanniki. All rights reserved.
//

import Foundation

class AlamofireRequester: Requester {
    func getData(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        debugPrint("making request with alamofire")
        
        let emptyData = Data()
        completion(emptyData, nil)
    }
}
