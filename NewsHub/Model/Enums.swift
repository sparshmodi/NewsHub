//
//  Enums.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

enum Category {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
    
    func toString() -> String {
        switch self {
        case .business:
            return "business"
        case .entertainment:
            return "entertainment"
        case .general:
            return "general"
        case .health:
            return "health"
        case .science:
            return "science"
        case .sports:
            return "sports"
        case .technology:
            return "technology"
        }
    }
}

enum SortBy {
    case relevancy
    case popularity
    case publishedAt
    
    func toString() -> String {
        switch self {
        case .relevancy:
            return "relevancy"
        case .popularity:
            return "relevancy"
        case .publishedAt:
            return "publishedAt"
        }
    }
}
