//
//  Property.swift
//  PropertyFinder
//
//  Created by Gohary on 11/8/17.
//  Copyright © 2017 Gohary. All rights reserved.
//

import UIKit
import ObjectMapper

class Property: Mappable {

    var price:          String?
    var subject:        String?
    var bedrooms:       Int?
    var thumbnail:      String?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        price           <- map["price"]
        subject         <- map["subject"]
        bedrooms        <- map["bedrooms"]
        thumbnail       <- map["thumbnail"]

    }
}
