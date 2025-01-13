//
//  RecipeViewModel.swift
//  FetchTakehomeAssessment
//
//  Created by Rebecca Banks on 1/11/25.
//

import Foundation

class RecipeViewModel {
    let recipe: Recipe

    init(recipe: Recipe) {
        self.recipe = recipe
    }

    var nameLabel: String {
        recipe.name
    }

    var cuisineLabel: String {
        recipe.cuisine
    }

    var youtubeUrl: URL? {
        if let urlString = recipe.youtubeUrl {
            return URL(string: urlString)
        }
        return nil
    }

    var sourceUrl: URL? {
        if let urlString = recipe.sourceUrl {
            return URL(string: urlString)
        }
        return nil
    }
}
