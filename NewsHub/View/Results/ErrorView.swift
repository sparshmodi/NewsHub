//
//  ErrorView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 22-04-2024.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    
    var body: some View {
        Text("\(error.localizedDescription) Please try again later...")
            .padding(.horizontal, 12)
            .padding(.top, 32)
            .font(.subheadline)
    }
}

#Preview {
    ErrorView(error: NSError(domain: "test", code: 12))
}
