//
//  PropertiesListTests.swift
//  PropertyFinderTests
//
//  Created by Gohary on 11/9/17.
//  Copyright © 2017 Gohary. All rights reserved.
//

import XCTest
@testable import PropertyFinder

class PropertiesListTests: XCTestCase {
    let viewModel = PropertiesListViewModel()
    let client  = APIClient()

    func testPropertiesListAPI() {

        let expectations = expectation(description: "The Response result match the expected results")
        client.fetchPropertiessList(forPage: 0, andSorting:.bedroomsAssending) { (list, error) in
            guard (list != nil) && (list!.count > 0) else{
                return XCTFail("failed to get properties from API")
            }
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: { (error) in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }
        })
    }
    func testPropertiesMappingToObjects(){
        let expectations = expectation(description: "The Response result match the expected results")

        viewModel.getProperties {
            guard self.viewModel.properties.count > 0 else{
                return XCTFail("failed to map properties from API")
            }
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10, handler: { (error) in
            if let error = error {
                print("Failed : \(error.localizedDescription)")
            }
        })
    }
}
