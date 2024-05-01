//
//  NewsOverlayView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 20-04-2024.
//

import SwiftUI

struct NewsOverlayView: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(article.title)
                .font(.title)
                .lineLimit(3)
            if let description = article.description {
                Text(description)
                    .lineLimit(10)
            }
            if let content = article.content {
                Text(content)
                    .font(.caption)
                    .lineLimit(12)
            }
        }
        .padding(20)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    NewsOverlayView(
        article: .init(
            id: UUID(),
            source:
                    .init(
                        id: nil,
                        name: "BBC"
                    ),
            author: nil,
            title: "Test Title",
            description: "Test Description",
            url: "Test URL",
            urlToImage: nil,
            content: "TestContentTestContent")
    )
}
