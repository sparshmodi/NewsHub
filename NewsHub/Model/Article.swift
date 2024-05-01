//
//  Article.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

import Foundation

typealias Articles = [Article]

struct Article: Codable, Identifiable, Equatable {
    let id: UUID
    let source: ArticleSource
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.source = try container.decode(ArticleSource.self, forKey: .source)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.url = try container.decode(String.self, forKey: .url)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
    }
    
    var titleToDisplay: String {
        guard let sourceIndex = title.lastIndex(of: "-") else {
            return title
        }
        return .init(title.prefix(upTo: title.index(before: sourceIndex)))
    }
}

struct ArticleSource: Codable, Equatable  {
    let id: String?
    let name: String?
}
