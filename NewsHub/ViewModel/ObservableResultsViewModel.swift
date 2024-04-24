//
//  ObservableResultsViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import Combine

class ObservableResultsViewModel: ObservableObject {
    @Published var articles: Articles = []
    @Published var totalArticles: Int? = nil
    @Published var requestError: Error? = nil
    
    func loadMoreItems() -> Void {
        fatalError("subclasses should override this method")
    }
    
    func resetState() {
        articles = []
        totalArticles = nil
    }
    
    let pageSize = 20
    let service = NewsApiService.shared
    
    var nextPage: Int {
        articles.count % pageSize == 0 ? articles.count / pageSize + 1 : ((articles.count - 1) / pageSize) + 2
    }
}
