//
//  HeadlinesViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import Foundation
import Combine

class HeadlinesViewModel: ObservableResultsViewModel {
    @Published var articles: Articles = []
    
    @Published var selectedCategory: Category? = nil {
        didSet {
            fetchHeadlines()
        }
    }
    
    init() {
        subscribeToSubject()
        fetchInitialResults()
    }
    
    private let service = NewsApiService.shared
    private let articlesSubject = CurrentValueSubject<Articles, Never>([])
    
    func fetchHeadlines() {
        service.fetchTopHeadlines(category: selectedCategory) { result in
            switch result {
            case .success(let data):
                guard let data else { return }
                self.articlesSubject.send(data.articles)
            }
        }
    }
}

private extension HeadlinesViewModel {
    func subscribeToSubject() {
        articlesSubject
            .receive(on: DispatchQueue.main)
            .assign(to: &$articles)
    }
    
    func fetchInitialResults() {
        service.fetchTopHeadlines { result in
            switch result {
            case .success(let data):
                guard let data else { return }
                self.articlesSubject.send(data.articles)
            }
        }
    }
}
