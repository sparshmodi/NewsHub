//
//  NewsApiService.swift
//  NewsHub
//
//  Created by Sparsh Modi on 17-04-2024.
//

import Foundation
import Combine

class NewsApiService {
    static let shared = NewsApiService()
    
    private init() {}
    
    deinit {
        let _ = cancellables.map { $0.cancel() }
    }
    
    let apiBaseUrl = URL(string: "https://newsapi.org/")!
    var cancellables: [AnyCancellable] = []
    
    public func fetchEverything(
        searchPhrase: String? = nil,
        sources: String? = nil,
        sortBy: SortBy? = nil,
        pageSize: Int? = nil,
        page: Int? = nil,
        completion: @escaping (Result<EverythingResponse?, Error>) -> Void
    ) {
        let everythingUrl = apiBaseUrl.appending(path: "v2/everything")
        var parameters: [URLQueryItem] = []
        
        if let searchPhrase {
            parameters.append(.init(name: "q", value: searchPhrase))
        }
        
        if let sources {
            parameters.append(.init(name: "sources", value: sources))
        }
        
        if let sortBy {
            parameters.append(.init(name: "sortBy", value: sortBy.toString()))
        }
        
        if let pageSize {
            parameters.append(.init(name: "pageSize", value: String(pageSize)))
        }
        
        if let page {
            parameters.append(.init(name: "page", value: String(page)))
        }
        
        fetchData(
            with: everythingUrl,
            parameters: parameters
        ) { (result: Result<EverythingResponse, Error>) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func fetchTopHeadlines(
        category: Category? = nil,
        sources: String? = nil,
        searchPhrase: String? = nil,
        pageSize: Int? = nil,
        page: Int? = nil,
        completion: @escaping (Result<TopHeadlinesResponse?, Error>) -> Void
    ) {
        let topHeadlinesUrl = apiBaseUrl.appending(path: "v2/top-headlines")
        var parameters: [URLQueryItem] = []
        
        if let category {
            parameters.append(.init(name: "category", value: category.toString()))
        }
        
        if let sources {
            parameters.append(.init(name: "sources", value: sources))
        }
        
        if let searchPhrase {
            parameters.append(.init(name: "q", value: searchPhrase))
        }

        if let pageSize {
            parameters.append(.init(name: "pageSize", value: String(pageSize)))
        }
        
        if let page {
            parameters.append(.init(name: "page", value: String(page)))
        }
        
        parameters.append(.init(name: "country", value: "us"))
        
        fetchData(
            with: topHeadlinesUrl,
            parameters: parameters
        ) { (result: Result<TopHeadlinesResponse, Error>) in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func fetchSources(
        category: Category? = nil,
        completion: @escaping (Result<Sources?, Never>) -> Void
    ) {
        let sourceUrl = apiBaseUrl.appending(path: "v2/top-headlines/sources")
        var parameters: [URLQueryItem] = []
        
        if let category {
            parameters.append(.init(name: "category", value: category.toString()))
        }
        
        fetchData(
            with: sourceUrl,
            parameters: parameters
        ) { (result: Result<SourcesResponse, Error>) in
            switch result {
            case .success(let data):
                completion(.success(data.sources))
            case .failure:
                completion(.success(nil))
            }
        }
    }
    
    private func fetchData<T>(
        with url: URL,
        parameters: [URLQueryItem] = [],
        completion: @escaping (Result<T, Error>) -> Void
    ) where T: Codable {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        /// assuming the `url` from input does not have any existing parameters
        urlComponents.queryItems = parameters
        urlComponents.queryItems?.append(.init(name: "apiKey", value: NEWS_API_KEY))
        
        guard let urlWithParams = urlComponents.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: urlWithParams)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .sink(
                receiveCompletion: { result in
                    switch result {
                    case .failure(let error):
                        print("News API call failed with error: \(error)")
                        completion(.failure(error))
                    default:
                        break
                    }
                }, receiveValue: { data in
                    completion(.success(data))
                }
            )
            .store(in: &cancellables)
    }
}
