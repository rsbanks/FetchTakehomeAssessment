//
//  RecipeViewModelTests.swift
//  FetchTakehomeAssessmentTests
//
//  Created by Rebecca Banks on 1/12/25.
//

import XCTest
@testable import FetchTakehomeAssessment

final class RecipeViewModelTests: XCTestCase {

    func testRecipeViewModelSetUpWithData() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.nameLabel, "Apple & Blackberry Crumble")
        XCTAssertEqual(viewModel.cuisineLabel, "British")
        XCTAssertEqual(viewModel.sourceUrl, URL(string: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble"))
        XCTAssertEqual(viewModel.youtubeUrl, URL(string: "https://www.youtube.com/watch?v=4vhcOwVBDO4"))
    }

    func testRecipeViewModelSetUpWithoutData() {
        let viewModel = makeSUT(withData: false)
        XCTAssertEqual(viewModel.nameLabel, "Apple & Blackberry Crumble")
        XCTAssertEqual(viewModel.cuisineLabel, "British")
        XCTAssertEqual(viewModel.sourceUrl, nil)
        XCTAssertEqual(viewModel.youtubeUrl, nil)
    }

    private func makeSUT(withData: Bool = true,
                         file: StaticString = #filePath,
                         line: UInt = #line) -> RecipeViewModel {
        let recipe: Recipe
        if withData {
            recipe = MockAPIResponse().mockRecipe
        } else {
            recipe = MockAPIResponse().emptyRecipe
        }

        let viewModel = RecipeViewModel(recipe: recipe)
        trackMemoryLeak(viewModel, file: file, line: line)

        return viewModel
    }
}
