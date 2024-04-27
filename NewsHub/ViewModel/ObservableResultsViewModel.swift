//
//  ObservableResultsViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import Combine
import Foundation

class ObservableResultsViewModel: ObservableObject {
    @Published var articles: Articles = []
    @Published var totalArticles: Int? = nil
    @Published var requestError: Error? = nil
    
    var nextPage: Int {
        articles.count % pageSize == 0 ? articles.count / pageSize + 1 : articles.count / pageSize + 2
    }
    
    let pageSize = 20
    let service = NewsApiService.shared
    
    func loadMoreItems() -> Void {
        fatalError("subclasses should override this method")
    }
    
    func resetState() {
        DispatchQueue.main.async {
            self.articles = []
            self.totalArticles = nil
        }
    }
    
    func setArticles(_ articles: Articles, count: Int?) {
        DispatchQueue.main.async {
            self.requestError = nil
            self.articles += articles
            self.totalArticles = count
        }
    }
    
    func setError(_ error: Error) {
        DispatchQueue.main.async {
            self.requestError = error
        }
    }
}
