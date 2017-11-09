//
//  PropertiesListViewModel.swift
//  PropertyFinder
//
//  Created by Gohary on 11/8/17.
//  Copyright © 2017 Gohary. All rights reserved.
//

import UIKit

enum SortingType: String{
    case bedroomsAssending  = "ba"
    case bedroomsDescending = "bd"
    case priceAscending     = "pa"
    case priceDescending    = "pd"
}

class PropertiesListViewModel: NSObject {

    var apiClient = APIClient()
    var properties = [Property]()
    var pageNom = 0
    var currentSorting :SortingType = .priceDescending
    var isLoadingData = false


    func getProperties(completion: @escaping () -> Void) {
        isLoadingData = true
        apiClient.fetchPropertiessList(forPage: pageNom, andSorting:currentSorting) { (propertiesList, error) in
            self.isLoadingData = false
            if error == nil{
                let propertiesObjects = propertiesList?.map({ (propertyData) -> Property in
                    return Property(JSON: propertyData)!
                })
                self.properties.append(contentsOf:propertiesObjects!)
                completion()
            }else{
                log.debug(error ?? "gotError")
            }
        }
    }
    func changeSortingTo(sorteType:SortingType, completion: @escaping () -> Void){
        guard sorteType != currentSorting else {
            return
        }
        pageNom = 0
        properties = [Property]()
        currentSorting = sorteType
        getProperties {
            completion()
        }
    }

    func loadNextPage(completion: @escaping () -> Void){
        pageNom += 1
            getProperties {
                completion()
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
