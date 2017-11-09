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
    func fetchPropertiessList(forPage:Int,andSorting:SortingType , completion: @escaping ([[String:Any]]?, Error?) -> Void) {
        log.debug(andSorting.rawValue)

        Alamofire.request(PropertyRouter.getList(forPage, andSorting.rawValue))
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
                    log.debug(propertiesArray)
                    completion(propertiesArray, nil)
                }
        }
    }
}
