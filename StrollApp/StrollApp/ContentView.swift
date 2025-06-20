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
        TabView(selection: $tabSelection) {
            Tab(value: 0) {
                HomeView()
            } label: {
                Image(.cardsIcon)
            }
            Tab(value: 1) {
                HomeView()
            } label: {
                Image(.bonfireIconn)
            }
            Tab(value: 2) {
                HomeView()
            } label: {
                Image(.matchesIconn)
            }
            Tab(value: 3) {
                HomeView()
            } label: {
                Image(.profilee)
                tabItems(icon: .profilee, text: "Profile")
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
                .font(.proximaBold(size: 10))
        }
    }
}

#Preview {
    ContentView()
}


//struct ContentView: View {
//    @State private var tabSelection: Int = 0
//    var body: some View {
//        GeometryReader { geo in
//            TabView(selection: $tabSelection) {
//                Tab(value: 0) {
//                    HomeView()
//                } label: {
//                    tabItems(icon: .pokerIcon, text: "Cards")
//                }
//                Tab(value: 1) {
//                    HomeView()
//                } label: {
//                    Image(.bonfireIconn)
//                }
//                Tab(value: 2) {
//                    HomeView()
//                } label: {
//                    Image(.matchesIcon)
//                }
//                Tab(value: 3) {
//                    HomeView()
//                } label: {
//                    Image(.profileTab)
//                        .resizable()
//                        .scaledToFit()
//                }
//                
//            }
//            .tint(Color.appPurple)
//            .overlay(alignment: .bottomLeading) {
//                Text("10")
//                    .font(.proximaBold(size: 7))
//                    .foregroundStyle(Color(hex: "#000000"))
//                    .frame(width: 16, height: 13, alignment: .center)
//                    .background(
//                        RoundedRectangle(cornerRadius: 15)
//                            .fill(Color.appPurple)
//                    )
//                    .overlay(content: {
//                        RoundedRectangle(cornerRadius: 15)
//                            .stroke(Color(hex: "#000000"), lineWidth: 1.4)
//                    })
//                    .position(x: 56, y: geo.size.height - 40)
//            }
//        }
//    }
//}
