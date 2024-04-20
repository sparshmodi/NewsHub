//
//  Response.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

struct SourcesResponse: Codable {
    let status: String
    let sources: Sources
}

struct TopHeadlinesResponse: Codable {
    let status: String
    let totalResults: Int?
    let articles: Articles
}

struct EverythingResponse: Codable {
    let status: String
    let totalResults: Int?
    let articles: Articles
}
