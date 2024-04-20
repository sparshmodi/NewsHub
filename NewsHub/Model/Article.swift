//
//  Article.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

typealias Articles = [Article]

struct Article: Codable, Hashable {
    let source: ArticleSource
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct ArticleSource: Codable, Hashable {
    let id: String?
    let name: String
}
