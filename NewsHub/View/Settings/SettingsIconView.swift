//
//  SettingsIconView.swift
//  NewsHub
//
//  Created by Sparsh Modi on 23-04-2024.
//

import SwiftUI

struct SettingsIconView: View {
    @Binding var shouldShowSettings: Bool
    
    var body: some View {
        Button(
            action: {
                shouldShowSettings = !shouldShowSettings
            }
        ) {
            Image(systemName: "gearshape")
                .resizable()
                .frame(width: 24, height: 24)
        }
        .foregroundStyle(.primary)
            
    }
}

//#Preview {
//    SettingsIconView()
//}
