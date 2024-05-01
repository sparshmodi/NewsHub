//
//  HomeViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

import Foundation

final class HomeViewModel: ObservableObject {
    init() {}

    let searchChildViewModel = SearchViewModel()
    let headlinesChildViewModel = HeadlinesViewModel()
}
