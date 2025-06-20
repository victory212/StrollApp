//
//  HomeView.swift
//  StrollApp
//
//  Created by Okoi Victory Ebri on 19/06/2025.
//

import Foundation
import SwiftUI


struct HomeView: View {
    var body: some View {
        ZStack {
            shinyImageBackground
                .ignoresSafeArea()
            
            Color.backgroundGradientColor
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 10) {
                header
                    .padding(.horizontal, 16)
                
                Spacer()
                    .frame(height: 13)
                
                horizontalScrollItems
                    .padding(.leading, 16)
                
                Spacer()
                    .frame(height: 16)
                
                selectionTabs
                    .padding(.horizontal, 16)
                
                captionInfo
                    .padding(.horizontal, 16)
                
                Spacer()
                    .frame(height: 1)
                
                chatList
                    .padding(.horizontal, 16)
                
                Spacer()
            }
            .ignoresSafeArea(.all, edges: .bottom)
            
        }
    }
}

#Preview {
    ContentView()
}


extension HomeView {
    private var shinyImageBackground: some View {
        Image(.appBackground)
            .resizable()
            .clipped()
    }
    private var header: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 12) {
                    Text("Your Turn")
                        .font(.proximaBold(size: 22))
                    
                    Text("7")
                        .font(.proximaBold(size: 10))
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
                        .font(.interBold(size: 10.8))
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
                .background(
                    Circle()
                        .fill(Color(hex: "#B5B2FF40"))
                        .blur(radius: 25)
                        .shadow(color: Color(hex: "#00000099"), radius: 25)
                        .blur(radius: 4.63)
                )
        }
        
    }
    
    private var selectionTabs: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                VStack(spacing: 2) {
                    Text("Chats")
                    Rectangle()
                        .frame(width: 53, height: 1)
                }
                
                VStack(spacing: 2) {
                    Text("Pending")
                        .foregroundStyle(.gray)
                    Rectangle()
                        .frame(width: 60, height: 1)
                        .foregroundStyle(Color.clear)
                }
                
                Spacer()
                
                
            }
            .font(.proximaBold(size: 22))
            .bold()
        }
    }
    
    private var captionInfo: some View {
        Text("The ice is broken. Time to hit it off")
            .font(.system(size: 12))
            .foregroundStyle(Color(hex: "#A8AFB7"))
            .italic()
    }
    
    private func chats(image: ImageResource, username: String, isLastMessage: Bool, lastMessage: String, lastMessageColor: Color, isYourMove: Bool, isNewChat: Bool, time: String, starred: Bool = false, unread: Bool = false, iamLast: Bool = false, isMedia: Bool = false) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 57.47, height: 58.44)
                .clipShape(Circle())
                .clipped()
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 10) {
                    Text(username)
                        .font(.proximaBold(size: 16))
                        .fontWeight(.bold)
                    
                    if isYourMove {
                        Text("Your move")
                            .font(.proximaBold(size: 10))
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
                                .font(.proximaBold(size: 10))
                        }
                        .foregroundStyle(.white)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.newChatColor)
                        )
                    }
                    
                    Spacer()
                    
                    Text(time)
                        .font(.proximaBold(size: 12))
                        .fontWeight(.medium)
                        .foregroundStyle(time == "Wed" ? Color(hex: "#A8AFB7") : Color.timeColor)
                }
                
                HStack {
                    if isLastMessage {
                        if iamLast {
                            Text(lastMessage)
                                .font(.proximaRegular(size: 14))
                                .foregroundStyle(lastMessageColor)
                                .lineLimit(2)
                                .frame(width: 222, alignment: .leading)
                        } else {
                            Text(lastMessage)
                                .font(.proximaBold(size: 14))
                                .foregroundStyle(lastMessageColor)
                                .lineLimit(2)
                                .frame(width: 222, alignment: .leading)
                        }
                    }
                    else if isMedia {
                        HStack(spacing: 10) {
                            Image(systemName: "mic.fill")
                            
                            Image(.wavelength)
                                .renderingMode(.original)
                            
                            Text("00:58")
                        }
                        .font(.proximaBold(size: 14))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(hex: "#8669A8"))
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
                                    .fill(Color.starredColor)
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
                                    .fill(Color.starredColor)
                            )
                    }
                }
            }
        }
    }
    
    private var chatList: some View {
        List {
            Group {
                chats(image: .chatPic1, username: "Jessica", isLastMessage: false, lastMessage: "", lastMessageColor: .gray, isYourMove: false, isNewChat: true, time: "6:21 pm", starred: true, isMedia: true)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                chats(image: .chatPic2, username: "Amanda", isLastMessage: true, lastMessage: "Lol i love house music too", lastMessageColor: .white, isYourMove: true, isNewChat: false, time: "6:21 pm")
                    .listRowInsets(EdgeInsets(top: 6, leading: 0, bottom: 5, trailing: 0))
                chats(image: .chatPic3, username: "Sila", isLastMessage: true, lastMessage: "You: I love the people there tbh, have you been?", lastMessageColor: .gray, isYourMove: false, isNewChat: false, time: "Wed", iamLast: true)
                    .listRowInsets(EdgeInsets(top: 6, leading: 0, bottom: 5, trailing: 0))
                chats(image: .chatPic4, username: "Marie", isLastMessage: true, lastMessage: "Hahaha that’s interesting, it does seem like people here are starting to like house music more", lastMessageColor: .white, isYourMove: true, isNewChat: false, time: "6:21 pm", unread: true)
                    .listRowInsets(EdgeInsets(top: 6, leading: 0, bottom: 5, trailing: 0))
                chats(image: .chatPic1, username: "jessica", isLastMessage: false, lastMessage: "", lastMessageColor: .gray, isYourMove: true, isNewChat: false, time: "6:21 pm")
                    .listRowInsets(EdgeInsets(top: 6, leading: 0, bottom: 5, trailing: 0))
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
    }
    
    private var horizontalScrollItems: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                horizontalContents(name: "Amanda, 22", question: "What is your favorite chilhood memory?", image: .blur1)
                horizontalContents(name: "Malte, 31", question: "What is the most important quality in friendships to you?", image: .blur2, madeMove: true)
                horizontalContents(name: "Binghan, 22", question: "What is your favorite chilhood memory?", image: .binghan, showSoundIcon: true)
            }
        }
        .frame(height: 205)
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
                            .font(.proximaBold(size: 9))
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
                    .font(.proximaBold(size: 10))
                    .fontWeight(.semibold)
                
                Spacer()
                    .frame(height: 47)
                
                
                VStack(spacing: 5) {
                    Text(name)
                        .font(.proximaBold(size: 15))
                    
                    Text(question)
                        .font(.proximaRegular(size: 10))
                        .foregroundStyle(Color(hex: "#CFCFFEB2"))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 12)
                        .frame(width: 115)
                }
                
            }
        }
        .frame(width: 145, height: 205)
        .cornerRadius(20)
    }
}
