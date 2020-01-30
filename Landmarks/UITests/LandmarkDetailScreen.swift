//
//  LandmarkDetailScreen.swift
//  UITests
//
//  Created by Russell Yeo on 29/01/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest

class LandmarkDetailScreenModel: ScreenModel {
    
    @discardableResult
    override init(context: UITestContext) {
        super.init(context: context)
    }
    
    private var favoriteButton: XCUIElement {
        return app.buttons.matching(identifier: "landmark-detail.button.favorite").firstMatch
    }
    
    private var backButton: XCUIElement {
        return app.navigationBars.buttons.firstMatch
    }
    
    func navigateBack() -> LandmarkListScreen {
        backButton.tap()
        return LandmarkListScreen(context: context)
    }
    
    func tapFavoriteButton() -> Self {
        favoriteButton.tap()
        return self
    }
    
}
