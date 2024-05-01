//
//  Response.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

struct SourcesResponse: Codable {
    let status: String
    let sources: [Source]
}

struct TopHeadlinesResponse: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Article]
}

struct EverythingResponse: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Article]
}
