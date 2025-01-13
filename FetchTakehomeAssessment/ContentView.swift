//
//  ContentView.swift
//  FetchTakehomeAssessment
//
//  Created by Rebecca Banks on 1/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                recipeList
                if viewModel.isLoading {
                    ProgressView("Loading")
                }
            }
            .background(Color.lightTeal)
            .alert(isPresented: $viewModel.hasError) {
                Alert(title: Text("Error: \(viewModel.errorMessage)"), message: Text("Please pull down to refresh and try again"), dismissButton: .default(Text("Dismiss")))
            }
            .refreshable {
                viewModel.refreshItems()
            }
        }
    }

    @ViewBuilder
    var recipeList: some View {
        List {
            if viewModel.recipes.isEmpty {
                EmptyView()
                    .listRowBackground(Color.lightTeal)
                    .listRowSeparator(.hidden)
            } else {
                ForEach(viewModel.recipes, id: \.uuid) { recipe in
                    RecipeView(recipe: recipe)
                        .listRowBackground(Color.lightTeal)
                        .listRowSeparator(.hidden)
                }
            }
        }
        .navigationTitle("Recipes")
        .listStyle(.plain)
        .toolbarBackground(Color.lightTeal, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
