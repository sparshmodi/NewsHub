//
//  ObservableResultsViewModel.swift
//  NewsHub
//
//  Created by Sparsh Modi on 21-04-2024.
//

import Combine

protocol ObservableResultsViewModel: ObservableObject {
    var articles: Articles { get }
}
