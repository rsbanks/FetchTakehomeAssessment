//
//  MockAPIResponse.swift
//  FetchTakehomeAssessmentTests
//
//  Created by Rebecca Banks on 1/12/25.
//

@testable import FetchTakehomeAssessment

class MockAPIResponse {
    let mockRecipe: Recipe
    let emptyRecipe: Recipe
    var recipes: [Recipe] = []

    init() {

        self.mockRecipe = Recipe(cuisine: "British", name: "Apple & Blackberry Crumble", photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg", sourceUrl: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble", uuid: "599344f4-3c5c-4cca-b914-2210e3b3312f", youtubeUrl: "https://www.youtube.com/watch?v=4vhcOwVBDO4")

        self.emptyRecipe = Recipe(cuisine: "British", name: "Apple & Blackberry Crumble", photoUrlSmall: nil, sourceUrl: nil, uuid: "599344f4-3c5c-4cca-b914-2210e3b3312f", youtubeUrl: nil)

        for _ in 0...9 {
            self.recipes.append(mockRecipe)
        }
    }
}
