//
//  APIResult.swift
//  FetchTakehomeAssessment
//
//  Created by Rebecca Banks on 1/11/25.
//

import Foundation

struct APIResult: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Equatable {
    let cuisine: String
    let name: String
    let photoUrlSmall: String?
    let sourceUrl: String?
    let uuid: String
    let youtubeUrl: String?

    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.cuisine == rhs.cuisine &&
        lhs.name == rhs.name &&
        lhs.photoUrlSmall == rhs.photoUrlSmall &&
        lhs.sourceUrl == rhs.sourceUrl &&
        lhs.uuid == rhs.uuid &&
        lhs.youtubeUrl == rhs.youtubeUrl
    }
}
