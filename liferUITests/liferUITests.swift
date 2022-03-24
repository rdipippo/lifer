//
//  liferUITests.swift
//  liferUITests
//
//  Created by Richard DiPippo on 3/23/22.
//

import XCTest

class liferUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        let app = XCUIApplication()
        app.buttons["goBack"].tap()
        let startingLife = app.textFields["startingLife"]
        startingLife.tap()
        startingLife.typeText("20")
        let done = app.buttons["Done"]
        done.tap()
    }

    func testStartingLife20() throws {
        let app = XCUIApplication()
        app.buttons["Start Game"].tap()
        let redLife = app.textFields["redLife"]
        XCTAssertEqual(redLife.value as! String, "20")
        let blueLife = app.textFields["blueLife"]
        XCTAssertEqual(blueLife.value as! String, "20")
    }
    
    func testCustomStartingLife() throws {
        let app = XCUIApplication()
        let startingLife = app.textFields["startingLife"]
        startingLife.tap()
        startingLife.typeText("25")
        let done = app.buttons["Done"]
        done.tap()
        app.buttons["Start Game"].tap()

        let redLife = app.textFields["redLife"]
        XCTAssertEqual(redLife.value as! String, "25")
        let blueLife = app.textFields["blueLife"]
        XCTAssertEqual(blueLife.value as! String, "25")
    }


}
