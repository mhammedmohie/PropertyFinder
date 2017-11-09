//
//  PropertiesListViewModel.swift
//  PropertyFinder
//
//  Created by Gohary on 11/8/17.
//  Copyright © 2017 Gohary. All rights reserved.
//

import UIKit

class PropertiesListViewModel: NSObject {
    var apiClient = APIClient()
    var properties: [Property]?
    func getProperties(completion: @escaping () -> Void) {
        
        apiClient.fetchPropertiessList(forPage: 0) { (propertiesList, error) in
            if error == nil{



                let propertiesObjects = propertiesList?.map({ (propertyData) -> Property in
                    return Property(JSON: propertyData)!
                })
                self.properties = propertiesObjects
                completion()
            }else{
                log.debug(error ?? "gotError")
            }
        }
    }

    func propertyPrice(property:Property) -> String {
        guard (property.price != nil) else{
            return ""
        }
        return property.price!
    }

    func propertyTitle(property:Property) -> String {
        guard (property.subject != nil) else{
            return ""
        }
        return property.subject!
    }
    func propertyBedRooms(property:Property) -> String{
        guard (property.bedrooms != nil) else {
            return ""
        }
        return String(describing: property.bedrooms!)
    }

}
