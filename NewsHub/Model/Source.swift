//
//  Source.swift
//  NewsHub
//
//  Created by Sparsh Modi on 17-04-2024.
//

import Foundation

typealias Sources = [Source]

struct Source: Codable {
    let id: String
    let name: String
    let description: String
    let url: String
    let category: String
    let language: String
    let country: String
}

struct SourcesResponse: Codable {
    let status: String
    let sources: Sources
}
