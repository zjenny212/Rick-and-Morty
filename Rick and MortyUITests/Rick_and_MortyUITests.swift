//
//  Rick_and_MortyUITests.swift
//  Rick and MortyUITests
//
//  Created by Keyi Zhu on 9/10/20.
//

import XCTest

class Rick_and_MortyUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testApp() throws {
        waitForElement(element: app.staticTexts["Page 1"])
        XCTAssertTrue(app.navigationBars["Rick and Morty"].exists)
        app.tables.cells.element(boundBy: 0).tap()
        waitForElement(element: app.staticTexts["DetailEpisode"])
        
        app.tables.cells.element(boundBy: 0).tap()
        waitForElement(element: app.images.element)
        XCTAssertTrue(app.staticTexts["cname"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func waitForElement(element: XCUIElement, duration: TimeInterval = 10) {
      let predicate = NSPredicate(format: "exists == true")
      let _ = expectation(for: predicate, evaluatedWith: element, handler: nil)

      // We use a buffer here to avoid flakiness with Timer on CI
      waitForExpectations(timeout: duration + 0.5)
    }
}
