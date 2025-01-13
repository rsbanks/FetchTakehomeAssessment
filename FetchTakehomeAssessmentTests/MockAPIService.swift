//
//  MockAPIService.swift
//  FetchTakehomeAssessmentTests
//
//  Created by Rebecca Banks on 1/12/25.
//

import Foundation
@testable import FetchTakehomeAssessment

class MockAPIService: APIService {
    override func getAPIData(completion: @escaping ([Recipe]?, String?) -> ()) {
        var recipes: [Recipe] = []
        let recipe = MockAPIResponse().mockRecipe

        for _ in 0...9 {
            recipes.append(recipe)
        }
        completion(recipes, nil)
    }
}

class MockAPIServiceWithError: APIService {
    override func getAPIData(completion: @escaping ([Recipe]?, String?) -> ()) {
        completion(nil, "Unable to retrieve data")
    }
}

class MockAPIServiceWithoutDataNoError: APIService {
    override func getAPIData(completion: @escaping ([Recipe]?, String?) -> ()) {
        completion(nil, nil)
    }
}
