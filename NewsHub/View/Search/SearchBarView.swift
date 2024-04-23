//
//  SearchBarView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 20-04-2024.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var isSearchActive: Bool
    
    var body: some View {
        TextField(
            "Search...",
            text: $viewModel.searchText
        )
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .onSubmit {
            isSearchActive = true
            viewModel.resetState()
            viewModel.fetchSearchResults()
        }
    }
}

//#Preview {
//    SearchBarView()
//}
