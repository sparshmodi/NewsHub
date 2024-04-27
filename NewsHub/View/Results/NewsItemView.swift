//
//  NewsItemView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

import SwiftUI

struct NewsItemView: View {
    let article: Article
    @EnvironmentObject var overlayViewModel: OverlayViewModel
    @Binding var tappedArticle: Article?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(article.source.name ?? "Unavailable")
                    .font(.footnote)
                    .fontWeight(.thin)
                    .lineLimit(1)
                
                Text(article.title)
                    .font(.body)
                    .lineLimit(4)
            }
            Spacer() // To make the views in HStack occupy the available horizontal space
            newsImage
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .onTapGesture {
            tappedArticle = article
        }
        .onLongPressGesture {
            overlayViewModel.longPressedArticle = article
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
                            .frame(maxWidth: 120, alignment: .top)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    },
                    placeholder: {
                        ProgressView()
                            .frame(maxWidth: 120)
                    }
                )
            } else {
                Image("DefaultNewsImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 120, alignment: .top)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 5))
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
