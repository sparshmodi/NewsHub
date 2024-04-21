//
//  ResultsView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import SwiftUI
import Combine

struct ResultsView<ViewModel: ObservableResultsViewModel>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selectedArticle: Article?
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.articles, id: \.self) {
                    NewsItemView(
                        article: $0,
                        selectedArticle: $selectedArticle
                    )
                }
            }
            .padding(.horizontal, 12)
            .animation(.easeIn, value: viewModel.articles)
        }
    }
}

//#Preview {
//    ResultsView()
//}
