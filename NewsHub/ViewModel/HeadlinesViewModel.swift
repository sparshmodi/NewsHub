//
//  HeadlinesViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import Combine

final class HeadlinesViewModel: ObservableResultsViewModel {
    @Published var selectedCategory: Category? = .general
    
    static let categories: [Category] = [.general, .business, .entertainment, .sports, .science, .technology, .health]
    
    override init() {
        super.init()
        fetchHeadlines()
    }
    
    func fetchHeadlines() {
        service.fetchTopHeadlines(
            category: selectedCategory,
            pageSize: pageSize,
            page: nextPage
        ) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                guard let data else { return }
                setArticles(data.articles, count: data.totalResults)
            case .failure(let error):
                setError(error)
            }
        }
    }
    
    override func loadMoreItems() {
        fetchHeadlines()
    }
}
