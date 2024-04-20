//
//  NewsItemView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

import SwiftUI

struct NewsItemView: View {
    let article: Article
    @Binding var selectedArticle: Article?
    @State private var isShowingSafariView = false
    
    var body: some View {
        HStack {
            VStack {
                Text(article.title)
                    .font(.title3)
                    .lineLimit(2)
    
                if let description = article.description {
                    Text(description)
                        .font(.subheadline)
                        .lineLimit(4)
                }
            }
            newsImage
        }
        .padding(12)
        .background(Color.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            isShowingSafariView = true
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: article.url)!)
        }
    }
    
    var newsImage: some View {
        Group {
            if let urlToImage = article.urlToImage {
                AsyncImage(
                    url: .init(
                        string: urlToImage
                    ),
                    content: {
                        $0
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 120, maxHeight: 120, alignment: .top)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    },
                    placeholder: {
                        ProgressView()
                            .frame(maxWidth: 120, maxHeight: 120)
                    }
                )
            } else {
                Image("defaultNewsImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 120, alignment: .top)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

//#Preview {
//    NewsItemView(
//        article: .init(
//            source: .init(
//                id: "test",
//                name: "testName"),
//            author: "test",
//            title: "Title",
//            description: "Description",
//            url: "https://www.google.com/",
//            urlToImage: "https://picsum.photos/536/354",
//            publishedAt: "asdf",
//            content: "asdf"
//        ),
//        isShowingOverlay:
//    )
//}
