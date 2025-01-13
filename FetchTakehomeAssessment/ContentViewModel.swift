//
//  ContentViewModel.swift
//  FetchTakehomeAssessment
//
//  Created by Rebecca Banks on 1/11/25.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var recipes: [Recipe]
    @Published var hasError: Bool
    @Published var errorMessage: String
    @Published var isLoading: Bool
    private let apiService: APIService

    init(apiService: APIService = APIService()) {
        self.recipes = []
        self.hasError = false
        self.errorMessage = ""
        self.isLoading = false
        self.apiService = apiService
        fetchItems()
    }

    func refreshItems() {
        self.recipes = []
        fetchItems()
    }

    private func fetchItems() {
        self.isLoading = true
        self.apiService.getAPIData() { newRecipes, error in
            if let error {
                self.hasError = true
                self.errorMessage = error
            }
            else if let newRecipes, !newRecipes.isEmpty {
                self.recipes = newRecipes
                self.errorMessage = ""
            } else {
                self.hasError = true
                self.errorMessage = "No recipes found"
            }
            self.isLoading = false
        }
    }
}
