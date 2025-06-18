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


struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            header
            
            Spacer()
                .frame(height: 13)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 14) {
                    horizontalContents(name: "Amanda, 22", question: "What is your favorite chilhood memory?", image: .blur1)
                    horizontalContents(name: "Malte, 31", question: "What is the most important quality in friendships to you?", image: .blur2, madeMove: true)
                    horizontalContents(name: "Binghan, 22", question: "What is your favorite chilhood memory?", image: .binghan, showSoundIcon: true)
                }
            }
            .frame(height: 205)
            
            Spacer()
                .frame(height: 16)
            
            selectionTabs
            
            captionInfo
            
            Spacer()
                .frame(height: 6)
            
            List {
                Group {
                    chats(image: .chatPic1, username: "Jessica", isLastMessage: false, lastMessage: "", lastMessageColor: .gray, isYourMove: false, isNewChat: true, time: "6:21 pm", starred: true)
                    chats(image: .chatPic2, username: "Amanda", isLastMessage: true, lastMessage: "Lol i love house music too", lastMessageColor: .white, isYourMove: true, isNewChat: false, time: "6:21 pm")
                    chats(image: .chatPic3, username: "Sila", isLastMessage: true, lastMessage: "You: I love the people there tbh, have you been?", lastMessageColor: .gray, isYourMove: false, isNewChat: false, time: "wed")
                    chats(image: .chatPic4, username: "Marie", isLastMessage: true, lastMessage: "Hahaha that’s interesting, it does seem like people here are starting to like house music more", lastMessageColor: .white, isYourMove: true, isNewChat: false, time: "6:21 pm", unread: true)
                    chats(image: .chatPic1, username: "jessica", isLastMessage: false, lastMessage: "", lastMessageColor: .gray, isYourMove: true, isNewChat: false, time: "6:21 pm")
                }
                .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
            .listStyle(.inset)
            .scrollIndicators(.hidden)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}


extension HomeView {
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 12) {
                    Text("Your Turn")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                    
                    Text("7")
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(hex: "#0E0E0E"))
                        .padding(7)
                        .background(
                            Circle()
                                .fill(Color.appPurple)
                        )
                }
                
                Text("Make your move, they are waiting  🎵")
                    .foregroundStyle(.gray)
                    .font(.system(size: 12))
                    .italic()
            }
            
            Spacer()
            
            Image(.pic)
                .resizable()
                .scaledToFill()
                .frame(width: 44.37, height: 44.37)
                .clipShape(Circle())
                .padding(2)
                .overlay {
                    Circle()
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(
                                    colors: [
                                        Color(hex: "#36631A"),
                                        Color.green.opacity(0.7),
                                        Color.green,
                                    ]
                                ),
                                center: .center
                            ),
                            lineWidth: 3
                        )
                }
                .overlay(alignment: .bottom) {
                    Text("90")
                        .font(.system(size: 10.8))
                        .fontWeight(.bold)
                        .frame(width: 42, height: 18.4)
                        .padding(.vertical, 2.7)
                        .padding(.horizontal, 3)
                        .background(
                            Color(.secondarySystemBackground),
                            in: RoundedRectangle(cornerRadius: 20)
                        )
                        .position(x: 25, y: 49)
                }
        }
        
    }
    
    private var selectionTabs: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                VStack(spacing: 5) {
                    Text("Chats")
                    Rectangle()
                        .frame(width: 58, height: 2)
                }
                
                VStack(spacing: 5) {
                    Text("Pending")
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width: 60, height: 2)
                        .foregroundStyle(Color.clear)
                }
                
                Spacer()
                
                
            }
            .font(.system(size: 22))
            .bold()
        }
    }
    
    private var captionInfo: some View {
        Text("The ice is broken. Time to hit it off")
            .font(.system(size: 12))
            .foregroundStyle(Color(hex: "#A8AFB7"))
            .italic()
    }
    
    private func chats(image: ImageResource, username: String, isLastMessage: Bool, lastMessage: String, lastMessageColor: Color, isYourMove: Bool, isNewChat: Bool, time: String, starred: Bool = false, unread: Bool = false) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 66.44, height: 65.47)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 10) {
                    Text(username)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    
                    if isYourMove {
                        Text("Your move")
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundStyle(.white)
                            .padding(.vertical, 2)
                            .padding(.horizontal, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color(hex: "#282828CC")
                                         )
                            )
                    }
                    
                    if isNewChat {
                        HStack {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 5))
                            Text("New chat")
                                .font(.system(size: 10, weight: .semibold))
                        }
                        .foregroundStyle(.white)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hex: "#42406FCC")
                                     )
                        )
                    }
                    
                    Spacer()
                    
                    Text(time)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundStyle(Color.appPurple)
                }
                
                HStack {
                    if isLastMessage {
                        Text(lastMessage)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundStyle(lastMessageColor)
                            .lineLimit(2)
                            .frame(width: 222, alignment: .leading)
                    }
                    else {
                        HStack(spacing: 6) {
                            Image(systemName: "mic.fill")
                            
                            Image(systemName: "waveform")
                            
                            Text("00:58")
                        }
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.appPurple)
                    }
                    
                    
                    Spacer()
                    
                    if starred {
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color(hex: "#000000"))
                            .font(.system(size: 10))
                            .frame(width: 18, height: 14)
                            .padding(.vertical, 1)
                            .padding(.horizontal, 3)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.appPurple)
                            )
                    }
                    
                    if unread {
                        Text("4")
                            .foregroundStyle(Color(hex: "#000000"))
                            .font(.system(size: 10, weight: .bold))
                            .frame(width: 18, height: 14)
                            .padding(.vertical, 1)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.appPurple)
                            )
                    }
                }
            }
        }
    }
    
    private func horizontalContents (name: String, question: String, image: ImageResource, madeMove: Bool = false, showSoundIcon: Bool = false) -> some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 145, height: 205)
                .clipped()

                VStack(spacing: 5) {
                    if madeMove {
                        HStack {
                            Image(.sound)
                            
                            Text("They made a move!")
                                .font(.system(size: 9))
                                .fontWeight(.medium)
                        }
                        .frame(width: 110, height: 19)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 24)
                                .fill(Color(hex: "#0B0C0D"))
                        )
                        .padding()
                    }
                    
                    if showSoundIcon {
                        HStack {
                            Image(.sound)
                                .frame(width: 24, height: 24)
                                .background(
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(Color(hex: "#0B0C0D"))
                                )
                                .padding()
                            
                            Spacer()
                        }
                    }
                    
                    Spacer()
                    
                    Text("Tap to answer")
                        .foregroundStyle(Color(hex: "#A8AFB7"))
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                    
                    Spacer()
                        .frame(height: 47)
                    
                    
                    VStack(spacing: 5) {
                        Text(name)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        
                        Text(question)
                            .font(.system(size: 10))
                            .foregroundStyle(Color(hex: "#CFCFFEB2"))
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 12)
                    }
                    
                }
            
           
        }
        .frame(width: 145, height: 205)
        .cornerRadius(20)
    }
}
