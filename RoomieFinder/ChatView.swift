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
                    ForEach(0..<3) {_ in
                        chatbubble()
                    }
                }
                .frame(width: UIScreen.main.bounds.size.width * 0.8)
            }
            .frame(maxHeight: 400)
            .border(pink)
            TextField("Message", text: $message)
                .textFieldStyle(defaultText())
                .border(blue)
            Spacer()
        }
        .background(cream)
    }
}

struct chatbubble: View{
    var  body: some View{
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(gray)
            .overlay(Text("hello world"))
            .foregroundColor(cream)
            .frame(width: UIScreen.main.bounds.size.width * 0.6, height: UIScreen.main.bounds.size.height * 0.1, alignment: .trailing)
            .offset(x:30, y:0)
    }
}

struct Previews_ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "chat")
    }
}
