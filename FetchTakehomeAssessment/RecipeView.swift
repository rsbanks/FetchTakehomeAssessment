//
//  RecipeView.swift
//  FetchTakehomeAssessment
//
//  Created by Rebecca Banks on 1/11/25.
//

import SwiftUI

struct RecipeView: View {
    @State var presentPopup: Bool = false
    private let viewModel: RecipeViewModel

    init(recipe: Recipe) {
        self.viewModel = RecipeViewModel(recipe: recipe)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            nameView
            Divider().background(Color.terracottaRed)
            HStack(spacing: 5) {
                infoView
                Spacer()
                imageView
            }
        }.padding(.all, 10)
            .background(Color.beige.opacity(0.7), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }

    @ViewBuilder
    var nameView: some View {
        Text("\(viewModel.nameLabel)")
            .font(.title2)
            .bold()
    }

    @ViewBuilder
    var infoView: some View {
        VStack(alignment: .leading, spacing: 10) {
            cuisineView
            sourceUrlView
            youtubeUrlView
            Spacer()
        }
    }

    @ViewBuilder
    var cuisineView: some View {
        Text("\(viewModel.cuisineLabel)")
            .font(.title3)
            .italic()
    }

    @ViewBuilder
    var youtubeUrlView: some View {
        HStack {
            Image(systemName: "play.rectangle")
            if let url = viewModel.youtubeUrl {
                Link("Video Tutorial", destination: url)
                    .foregroundStyle(Color.blue)
                    .font(.title3)
            } else {
                Text("No video link found")
                    .font(.title3)
                    .italic()
            }
        }
    }

    @ViewBuilder
    var sourceUrlView: some View {
        HStack {
            Image(systemName: "safari")
            if let url = viewModel.sourceUrl {
                Link("Recipe", destination: url)
                    .font(.title3)
                    .foregroundStyle(Color.blue)
            } else {
                Text("No recipe link found")
                    .font(.title3)
                    .italic()
            }
        }
    }

    @ViewBuilder
    var imageView: some View {
        if let imageUrl = viewModel.recipe.photoUrlSmall {
            AsyncImageCache(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "photo")
                        .imageScale(.large)
                case .failure:
                    noImageAvailable
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                @unknown default:
                    noImageAvailable
                }
            }.frame(width: 100, height: 100)
                .cornerRadius(15)
        } else {
            noImageAvailable
        }
    }

    @ViewBuilder
    var noImageAvailable: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 15)
                .fill(.gray)
            Text("No image available")
                .multilineTextAlignment(.center)
        }.frame(width: 100, height: 100)
            .cornerRadius(15)
    }
}

#Preview {
    RecipeView(recipe: Recipe(cuisine: "British", name: "Apple Crumble", photoUrlSmall: nil, sourceUrl: nil, uuid: "2343426454567", youtubeUrl: nil))
}
