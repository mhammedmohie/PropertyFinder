//
//  PropertyFinderUITests.swift
//  PropertyFinderUITests
//
//  Created by Gohary on 11/8/17.
//  Copyright © 2017 Gohary. All rights reserved.
//

import XCTest

class PropertyFinderUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testListPaging() {

        XCUIApplication().tables.element.swipeUp()
        sleep(2)

        XCUIApplication().tables.element.swipeUp()
        sleep(2)

        XCUIApplication().tables.element.swipeDown()
        sleep(2)

    }

    func testSorting()  {

        let app = XCUIApplication()
        let sortItemsButton = app.navigationBars["PropertyFinder.View"].buttons["Sort Items"]
        sortItemsButton.tap()

        let dataSortingAlert = app.alerts["Data Sorting"]
        dataSortingAlert.buttons["Bedrooms Ascending"].tap()
        sortItemsButton.tap()
        dataSortingAlert.buttons["Bedrooms Descending"].tap()
        sortItemsButton.tap()
        dataSortingAlert.buttons["Price Ascending"].tap()
        sortItemsButton.tap()

    }
}
