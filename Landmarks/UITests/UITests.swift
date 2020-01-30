//
//  UITests.swift
//  UITests
//
//  Created by Russell Yeo on 29/01/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import XCTest

class LandmarksUITests: UITestCase {
    func testAddLandmarkToFavorites() {
        LandmarkListScreen(context: context)
            .selectLandmark("Lake McDonald")
            .tapFavoriteButton()
            .navigateBack()
            .verifyLandmarkIsFavorite("Lake McDonald")
    }
}
