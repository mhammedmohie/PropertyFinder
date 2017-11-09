//
//  APIClient.swift
//  PropertyFinder
//
//  Created by Gohary on 11/8/17.
//  Copyright © 2017 Gohary. All rights reserved.
//

import UIKit
import Alamofire

class APIClient: NSObject {
    func fetchPropertiessList(forPage:Int, completion: @escaping ([[String:Any]]?, Error?) -> Void) {
        Alamofire.request(PropertyRouter.getList(0, "bd"))
            .responseJSON { response in
                guard response.result.error == nil else {
                    completion(nil, response.result.error)
                    return
                }
                guard let json = response.result.value as? [String: Any] else {
                    completion(nil, response.result.error)
                    return
                }
                if let propertiesArray = json["res"] as? [[String:Any]]{

                    completion(propertiesArray, nil)
                }
        }
    }
}
