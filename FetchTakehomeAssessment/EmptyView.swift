//
//  EmptyView.swift
//  FetchTakehomeAssessment
//
//  Created by Rebecca Banks on 1/12/25.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.beige)
                .frame(height: 200)
            Text("No recipes to display")
                .italic()
                .font(.largeTitle)
        }
    }
}

#Preview {
    EmptyView()
}
