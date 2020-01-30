//
//  LandmarkListScreen.swift
//  UITests
//
//  Created by Russell Yeo on 29/01/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest

class LandmarkListScreen: ScreenModel {
    
    @discardableResult
    override init(context: UITestContext) {
        super.init(context: context)
    }
    
    private func landmarkRow(name: String) -> XCUIElement {
        return app.tables.cells.buttons[name].firstMatch
    }
    
    private func favoriteIconInRow(name: String) -> XCUIElement {
        return landmarkRow(name: name).images.matching(identifier: "landmark-row.icon.favourite").firstMatch
    }
    
    func selectLandmark(_ name: String) -> LandmarkDetailScreenModel {
        landmarkRow(name: name).tap()
        return LandmarkDetailScreenModel(context: context)
    }
    
    @discardableResult
    func verifyLandmarkIsFavorite(_ name: String) -> Self {
        XCTAssertNotNil(favoriteIconInRow(name: name))
        return self
    }
    
    @discardableResult
    func verifyLandmarkIsNotFavorite(_ name: String) -> Self {
        XCTAssertNil(favoriteIconInRow(name: name))
        return self
    }
    
}
