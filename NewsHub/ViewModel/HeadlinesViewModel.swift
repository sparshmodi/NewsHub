//
//  HeadlinesViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import Combine

final class HeadlinesViewModel: ObservableResultsViewModel {
    @Published var selectedCategory: Category? = nil {
        didSet {
            resetState()
            fetchHeadlines()
        }
    }
    
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
                requestError = nil
                articles += data.articles
                totalArticles = data.totalResults
            case .failure(let error):
                requestError = error
            }
        }
    }
    
    override func loadMoreItems() {
        fetchHeadlines()
    }
}
