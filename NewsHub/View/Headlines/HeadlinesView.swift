//
//  HeadlinesView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import SwiftUI
import Combine

struct HeadlinesView: View {
    @ObservedObject var viewModel: HeadlinesViewModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories, id: \.self) { category in
                        Text(category.toString().capitalized)
                            .font(.title3)
                            .padding(6)
                            .background(viewModel.selectedCategory == category ? Color.gray.opacity(0.6) : Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .onTapGesture {
                                viewModel.selectedCategory = viewModel.selectedCategory == category ? nil : category
                            }
                    }
                }
                .padding(.horizontal, 12)
            }
            ResultsView(viewModel: viewModel)
        }
    }
    
    private let categories: [Category] = [.business, .entertainment, .general, .health, .science, .sports, .technology]
}

//#Preview {
//    HeadlinesView()
//}
