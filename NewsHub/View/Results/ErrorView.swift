//
//  ErrorView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 22-04-2024.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        Text("Some error has occured. Please try again later...")
            .padding(.horizontal, 12)
            .padding(.top, 32)
            .font(.subheadline)
    }
}

#Preview {
    ErrorView()
}
