//
//  SearchBarView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 20-04-2024.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var viewModel: SearchViewModel
    @FocusState private var isFocused: Bool
    @Binding var shouldShowSearchResults: Bool
    
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
            shouldShowSearchResults = true
            viewModel.resetState()
            viewModel.fetchSearchResults()
        }
        .focused($isFocused)
        .overlay {
            if isFocused && !viewModel.searchText.isEmpty {
                HStack {
                    Spacer()
                    Button {
                        viewModel.searchText = ""
                        isFocused = false
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .padding(10)
                    }
                }
            }
        }
    }
}

//#Preview {
//    SearchBarView()
//}
