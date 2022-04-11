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
    
    func testBlueLife() {
        let app = XCUIApplication()
        app.buttons["Start Game"].tap()
        let blueLifeUp = app.buttons["blueLifeUp"]
        blueLifeUp.tap()
        
        let blueLife = app.textFields["blueLife"]
        XCTAssertEqual(blueLife.value as! String, "21")
        
        let blueLifeDown = app.buttons["blueLifeDown"]
        blueLifeDown.tap()
        blueLifeDown.tap()
        
        XCTAssertEqual(blueLife.value as! String, "19")
        	
        blueLife.tap()
        XCTAssertEqual(blueLife.value as! String, "")
        
        let done = app.buttons["Done"]
        done.tap()
        XCTAssertEqual(blueLife.value as! String, "19")
        
        blueLife.tap()
        blueLife.typeText("30")
        
        done.tap()
        XCTAssertEqual(blueLife.value as! String, "30")
    }
    
    func testRedLife() {
        let app = XCUIApplication()
        app.buttons["Start Game"].tap()
        let redLifeUp = app.buttons["redLifeUp"]
        redLifeUp.tap()
        
        let redLife = app.textFields["redLife"]
        XCTAssertEqual(redLife.value as! String, "21")
        
        let redLifeDown = app.buttons["redLifeDown"]
        redLifeDown.tap()
        redLifeDown.tap()
        
        XCTAssertEqual(redLife.value as! String, "19")
        
        redLife.tap()
        XCTAssertEqual(redLife.value as! String, "")
        
        let done = app.buttons["Done"]
        done.tap()
        XCTAssertEqual(redLife.value as! String, "19")
        
        redLife.tap()
        redLife.typeText("30")
        
        done.tap()
        XCTAssertEqual(redLife.value as! String, "30")
    }
    
    func testResetLife() {
        let app = XCUIApplication()
        app.buttons["Start Game"].tap()
        
        let redLifeUp = app.buttons["redLifeUp"]
        redLifeUp.tap()
        
        let blueLifeDown = app.buttons["blueLifeDown"]
        blueLifeDown.tap()
        
        let resetLife = app.buttons["resetLife"]
        resetLife.tap()
        
        let redLife = app.textFields["redLife"]
        XCTAssertEqual(redLife.value as! String, "20")
        
        let blueLife = app.textFields["blueLife"]
        XCTAssertEqual(blueLife.value as! String, "20")
    }
    
    func testResetCustomLife() {
        let app = XCUIApplication()
        let startingLife = app.textFields["startingLife"]
        startingLife.tap()
        startingLife.typeText("25")
        let done = app.buttons["Done"]
        done.tap()
        app.buttons["Start Game"].tap()
        
        let redLifeUp = app.buttons["redLifeUp"]
        redLifeUp.tap()
        
        let blueLifeDown = app.buttons["blueLifeDown"]
        blueLifeDown.tap()
        
        let resetLife = app.buttons["resetLife"]
        resetLife.tap()
        
        let redLife = app.textFields["redLife"]
        XCTAssertEqual(redLife.value as! String, "25")
        
        let blueLife = app.textFields["blueLife"]
        XCTAssertEqual(blueLife.value as! String, "25")
    }


}
