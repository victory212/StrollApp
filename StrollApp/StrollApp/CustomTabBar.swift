//
//  CustomTabBar.swift
//  StrollApp
//
//  Created by Okoi Victory Ebri on 20/06/2025.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @Binding var tabSelection: Int
    var chatBadgeCount: Int
    @State private var animate: Bool = false
    @State private var animateHome: Bool = false
    @State private var animateMsg: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.clear)
                .frame(maxHeight: 51)
                .ignoresSafeArea(.all)
            HStack(spacing: 0.0) {
                ForEach(0..<TabModel.allCases.count, id: \.self) { index in
                    let tab = TabModel.allCases[index]
                    let isCurrent = tabSelection == index + 1
                    let showBadge = tab == .chats && chatBadgeCount > 0
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            tabSelection = index + 1
                            if tabSelection == 1 {
                                if #available(iOS 16.0, *) {
                                    UNUserNotificationCenter.current().setBadgeCount(0)
                                } else {
                                    UIApplication.shared.applicationIconBadgeNumber = 0
                                }
                            }
                        }
                    })
                    {
                        VStack(spacing: 2.0) {
                            if #available (iOS 18.0, *) {
                                Image(systemName: isCurrent ? tab.filledSystemImage : tab.systemImage)
                                    .font(.system(size: 22, weight: .semibold, design: .default))
                                    .foregroundStyle(isCurrent ? Color.primary : Color.gray)
                                    .badge(count: chatBadgeCount, showBadge: showBadge)
                                    .scaleEffect(isCurrent ? 1.08 : 1.0)
                                    .symbolEffect(.rotate.byLayer, options: .nonRepeating, isActive: animate && tab == .settings )
                                    .symbolEffect(.wiggle.forward.byLayer, options: .nonRepeating, isActive: animateMsg && tab == .chats)
                            } else {
                                Image(systemName: isCurrent ? tab.filledSystemImage : tab.systemImage)
                                    .font(.system(size: 22, weight: .semibold, design: .default))
                                    .foregroundStyle(isCurrent ? Color.primary : Color.gray)
                                    .badge(count: chatBadgeCount, showBadge: showBadge)
                                    .scaleEffect(isCurrent ? 1.08 : 1.0)
                            }
                            
                            Text(tab.rawValue)
                                .font(.system(size: 10.25, weight: .semibold, design: .default))
                                .foregroundStyle(isCurrent ? Color.primary : Color.gray)
                        }
                        .padding(.top, 8)
                        .frame(maxWidth: .infinity)
                    }
                    .onAppear {
                        if tabSelection == 1 {
                            if #available(iOS 16.0, *) {
                                UNUserNotificationCenter.current().setBadgeCount(0)
                            } else {
                                UIApplication.shared.applicationIconBadgeNumber = 0
                            }
                        }
                    }
                }
            }
        }
        .frame(maxHeight: 51)
        .background(Color.clear)
    }
}


enum TabModel: String, CaseIterable {
    case chats = "Chats"
    case settings = "Settings"
    
    var systemImage: String {
        switch self {
            //        case .metaView:
            //            return "timelapse"
        case .chats:
            return "message"
            //        case .buzz:
            //            return "timelapse"
            
            //        case .hive:
            //            return "circle.hexagonpath"
            //        case .create:
            //            return "plus.square"
            //        case .saved:
            //            return "arrow.down.app"
        case .settings:
            return "gear"
        }
    }
    
    var filledSystemImage: String {
        switch self {
            //        case .metaView:
            //            return "timelapse"
        case .chats:
            return "message.fill"
            //        case .buzz:
            //            return "timelapse"
            //        case .hive:
            //            return "circle.hexagonpath.fill"
            //        case .create:
            //            return "plus.square.fill"
            //        case .saved:
            //            return "arrow.down.app.fill"
        case .settings:
            return "gear"
        }
    }
    
}


struct BadgeViewModifier: ViewModifier {
    var count: Int
    var showBadge: Bool
    
    func body(content: Content) -> some View {
        ZStack(alignment: .topTrailing) {
            content
            
            if showBadge {
                Text("\(count)")
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .padding(6)
                    .background(Circle().fill(Color.red))
                    .overlay(
                        Circle().stroke(Color.clear, lineWidth: 1.1)
                    )
                    .offset(x: 11.5, y: -7.5)
            }
        }
    }
}

extension View {
    func badge(count: Int, showBadge: Bool) -> some View {
        self.modifier(BadgeViewModifier(count: count, showBadge: showBadge))
    }
}

