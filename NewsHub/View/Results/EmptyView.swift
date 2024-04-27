//
//  EmptyView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 26-04-2024.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        Text("Could not find anything. Try searching something different...")
            .padding(.horizontal, 12)
            .padding(.top, 32)
            .font(.subheadline)
    }
}

#Preview {
    EmptyView()
}
