//
//  SettingsView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 23-04-2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("appearance") private var appearance: Appearance = .system
    
    var body: some View {
        VStack {
            Form {
                Picker("Appearance", selection: $appearance) {
                    ForEach(Appearance.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.inline)
            }
        }
    }
}

#Preview {
    SettingsView()
}
