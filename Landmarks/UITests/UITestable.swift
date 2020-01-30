//
//  UITestable.swift
//  UITests
//
//  Created by Russell Yeo on 29/01/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest

typealias UITestContext = (app: XCUIApplication, testCase: UITestCase)

class UITestCase: XCTestCase {
    
    private(set) var app: XCUIApplication!
    
    var envVars = [String:String]()
    
    var context: UITestContext {
        return (app: app, testCase: self)
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        launchApp()
    }

    override func tearDown() {
        app.terminate()
        super.tearDown()
    }
    
    fileprivate func launchApp() {
        app = XCUIApplication()
        app.launchEnvironment = envVars
        app.launch()
    }
}

class ScreenModel {
    
    var app: XCUIApplication {
        return context.app
    }
    
    var testCase: UITestCase {
        return context.testCase
    }
    
    let context: UITestContext
    
    init(context: UITestContext) {
        self.context = context
        print("screen \(String(describing: self)) created")
    }
}
