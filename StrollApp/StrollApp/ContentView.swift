//
//  ContentView.swift
//  StrollApp
//
//  Created by Okoi Victory Ebri on 18/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection: Int = 0
    var body: some View {
        TabView(selection: $tabSelection){
            Tab(value: 0) {
                HomeView()
            } label: {
                tabItems(icon: .pokerIcon, text: "Cards")
            }
            Tab(value: 1) {
                HomeView()
            } label: {
                Image(.bonfireIcon)
            }
            Tab(value: 2) {
                HomeView()
            } label: {
                Image(.matchesIcon)
            }
            Tab(value: 3) {
                HomeView()
            } label: {
                Image(.profileTab)
            }
            
        }
        .tint(Color.appPurple)
    }
}

extension ContentView {
    private func tabItems(icon: ImageResource, text: String) -> some View {
        VStack(spacing: 3.51) {
            Image(icon)
            
            Text(text)
                .font(.system(size: 10))
        }
    }
}

#Preview {
    ContentView()
}
