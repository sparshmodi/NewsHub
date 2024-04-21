//
//  SearchViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import Foundation
import Combine

class SearchViewModel: ObservableResultsViewModel {
    @Published var searchText = ""
    @Published var articles: Articles = []
    
    init() {
        subscribeToSubject()
    }
    
    private let service = NewsApiService.shared
    private let articlesSubject = CurrentValueSubject<Articles, Never>([])
    
    func fetchSearchResults() {
        if searchText != "" {
            print("searching with search phrase: ", searchText)
            service.fetchEverything(searchPhrase: searchText) { result in
                switch result {
                case .success(let data):
                    guard let data else { return }
                    self.articlesSubject.send(data.articles)
                }
            }
        }
    }
}

private extension SearchViewModel {
    func subscribeToSubject() {
        articlesSubject
            .receive(on: DispatchQueue.main)
            .assign(to: &$articles)
    }
}
