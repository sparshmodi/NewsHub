//
//  SearchView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var isSearchActive: Bool
    
    var body: some View {
        VStack {
            SearchBarView(viewModel: viewModel, isSearchActive: $isSearchActive)
            ResultsView(viewModel: viewModel)
        }
    }
}

//#Preview {
//    SearchView()
//}
