//
//  HomeViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 18-04-2024.
//

import Combine

class HomeViewModel: ObservableObject {
    init() {}

    let searchChildViewModel = SearchViewModel()
    let headlinesChildViewModel = HeadlinesViewModel()
}
