//
//  AppLogoView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 23-04-2024.
//

import SwiftUI

struct AppLogoView: View {
    var body: some View {
        HStack {
            Text("NewsHub")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    AppLogoView()
}
