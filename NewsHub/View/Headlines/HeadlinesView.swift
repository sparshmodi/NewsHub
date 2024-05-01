//
//  HeadlinesView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import SwiftUI

struct HeadlinesView: View {
    @ObservedObject var viewModel: HeadlinesViewModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(HeadlinesViewModel.categories, id: \.self) { category in
                        Button(
                            action: {
                                if viewModel.selectedCategory != category {
                                    viewModel.selectedCategory = category
                                    viewModel.resetState()
                                    viewModel.fetchHeadlines()
                                }
                            }
                        ) {
                            Text(category.toString().capitalized)
                                .font(.title3)
                                .padding(6)
                                .background(viewModel.selectedCategory == category ? Color.gray.opacity(0.6) : Color.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .foregroundStyle(.primary)
                    }
                }
                .padding(.horizontal, 12)
            }
            ResultsView(viewModel: viewModel)
        }
    }
}

//#Preview {
//    HeadlinesView()
//}
