//
//  SearchViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import Combine

final class SearchViewModel: ObservableResultsViewModel {
    @Published var searchText = ""
    
    func fetchSearchResults() {
        guard searchText != "" else { return }
        
        service.fetchEverything(
            searchPhrase: searchText,
            pageSize: pageSize,
            page: nextPage
        ) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let data):
                guard let data else { return }
                articles += data.articles
                totalArticles = data.totalResults
            }
        }
    }
    
    override func loadMoreItems() {
        fetchSearchResults()
    }
}
