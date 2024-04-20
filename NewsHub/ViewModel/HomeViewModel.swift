//
//  HomeViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    init(
        service: NewsApiService
    ) {
        self.service = service
        fetchInitialResults()
        articlesSubject
            .receive(on: DispatchQueue.main)
            .assign(to: &$articles)
    }
    
    let service: NewsApiService
    let articlesSubject = CurrentValueSubject<Articles, Never>([])
    @Published var articles: Articles = []
}

private extension HomeViewModel {
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
