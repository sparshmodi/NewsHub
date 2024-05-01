//
//  SearchView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var shouldShowSearchResults: Bool
    
    var body: some View {
        VStack {
            SearchBarView(viewModel: viewModel, shouldShowSearchResults: $shouldShowSearchResults)
                .padding(.horizontal, 12)
            ResultsView(viewModel: viewModel)
        }
    }
}

#Preview {
    SearchView(viewModel: .init(), shouldShowSearchResults: .constant(false))
}
