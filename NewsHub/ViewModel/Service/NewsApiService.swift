//
//  NewsApiService.swift
//  NewsHub
//
//  Created by Sparsh Modi on 17-04-2024.
//

import Foundation
import Combine

class NewsApiService {
    init() {
    }
    
    deinit {
        let _ = cancellables.map { $0.cancel() }
    }
    
    let apiBaseUrl = URL(string: "https://newsapi.org/")!
    var cancellables: [AnyCancellable] = []
    
    
    private func fetchData<T>(
        with url: URL,
        parameters: [URLQueryItem] = [],
        completion: @escaping (Result<T, Error>) -> Void
    ) where T: Codable {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        /// assuming the `url` from input does not have any existing parameters
        urlComponents.queryItems = parameters
        
        guard let urlWithParams = urlComponents.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        print("url with aprams:", urlWithParams)
        
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
