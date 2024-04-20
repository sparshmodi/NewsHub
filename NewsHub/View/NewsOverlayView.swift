//
//  NewsOverlayView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 20-04-2024.
//

import SwiftUI

struct NewsOverlayView: View {
    let article: Article?

    var body: some View {
        if let article {
            VStack(alignment: .leading, spacing: 2) {
                Text(article.title)
                    .font(.title2)
                if let description = article.description {
                    Text(description)
                }
                if let content = article.content {
                    Text(content)
                        .font(.caption)
                }
            }
            .frame(maxHeight: 320)
            .background(Color.white)
            .padding(20)
        } else {
            ProgressView()
                .frame(width: 300, height: 200)
                .background(Color.white.opacity(0.5))
        }
    }
}

#Preview {
    NewsOverlayView(
        article: .init(
            source:
                    .init(
                        id: nil,
                        name: "BBC"
                    ),
            author: nil,
            title: "Test TitleTest TitleTest TitleTest TitleTest TitleTest TitleTest Title",
            description: "Test DescriptionTest DescriptionTest DescriptionTest DescriptionTest DescriptionTest Description",
            url: "try",
            urlToImage: nil,
            publishedAt: "asdf",
            content: "TestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContentTestContent")
    )
}
