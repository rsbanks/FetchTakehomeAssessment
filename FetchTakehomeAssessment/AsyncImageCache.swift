//
//  AsyncImageCache.swift
//  FetchTakehomeAssessment
//
//  Created by Rebecca Banks on 1/12/25.
//

import SwiftUI

struct AsyncImageCache<Content>: View where Content: View {

    private let url: URL?
    private let content: (AsyncImagePhase) -> Content

    init(url: URL?, @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.content = content
    }

    var body: some View {
        if let url, let image = ImageCache[url] {
            content(.success(image))
        } else {
            AsyncImage(url: url) { phase in
                downloadAndCacheImage(phase: phase)
            }
        }
    }

    func downloadAndCacheImage(phase: AsyncImagePhase) -> some View {
        if let url, case .success(let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}

#Preview {
    AsyncImageCache(url: URL(string: "")) { phase in
        switch phase {
        case .empty:
            ProgressView()
        case .failure:
            Image(systemName: "photo")
                .imageScale(.large)
        case .success(let image):
            image
                .resizable()
                .aspectRatio(1, contentMode: .fill)
        @unknown default:
            Image(systemName: "photo")
                .imageScale(.large)
        }
    }
}

class ImageCache {
    static private var cache: [URL: Image] = [:]

    static subscript(url: URL) -> Image? {
        get {
            cache[url]
        } set {
            cache[url] = newValue
        }
    }
}
