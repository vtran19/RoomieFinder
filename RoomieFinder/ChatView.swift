//
//  ChatView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI

struct ChatView: View {
    @Binding var screen: String
    @Binding var user2: Chat
    @State var message: String = "Message"
    var body: some View {
        VStack {
            // Back Button
            Button {
                self.screen = "allchats"
            } label: {
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.size.width * 0.05,
                           height: UIScreen.main.bounds.size.height * 0.05, alignment: .trailing)
                Text("Back")
                    .frame(width: UIScreen.main.bounds.size.width * 0.9,
                           height: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                    .accentColor(gray)
            }
            Circle()
                .foregroundColor(.pink)
                .frame(height: UIScreen.main.bounds.size.height * 0.1, alignment: .leading)
            Text("\(user2.name)")
                .font(.largeTitle)
                .bold()
            
            ScrollView {
                VStack{
                    
                    recievedChatbubble()
                    sentChatbubble()
                    sentChatbubble()
                    recievedChatbubble()
    
                }
                .frame(width: UIScreen.main.bounds.size.width * 0.8)
            }
            .frame(maxHeight: 400)
            HStack{
                TextField("Message", text: $message)
                    .font(.system(size: 20))
                    .padding(20)
                    .frame(maxWidth: UIScreen.main.bounds.size.width * 0.7, minHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                    .background(gray.opacity(0.25))
                    .cornerRadius(10)
                Button("Send"){}
                    .padding(20)
                    .frame(minWidth: UIScreen.main.bounds.size.width * 0.15, minHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                    .background(blue.opacity(0.75))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .background(cream)
    }
}

struct recievedChatbubble: View{
    var  body: some View{
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(gray.opacity(0.25))
            .overlay(Text("hello world"))
            .foregroundColor(.black)
            .frame(maxWidth:UIScreen.main.bounds.size.width * 0.6, minHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .trailing)
            .offset(x:-30, y:0)
    }
}

struct sentChatbubble: View{
    var  body: some View{
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(orange.opacity(0.25))
            .overlay(Text("hello world"))
            .foregroundColor(.black)
            .frame(maxWidth: UIScreen.main.bounds.size.width * 0.6, minHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .trailing)
            .offset(x:30, y:0)
    }
}

struct Previews_ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "chat")
    }
}
