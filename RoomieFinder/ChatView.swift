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
    var body: some View {
        VStack {
            // Back Button
            Button {
                self.screen = "allchats"
            } label: {
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.size.width * 0.05,
                           maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .trailing)
                Text("Back")
                    .frame(maxWidth: UIScreen.main.bounds.size.width * 0.9,
                           maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                    .accentColor(gray)
            }
            Circle()
                .foregroundColor(.pink)
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.2,
                       maxHeight: UIScreen.main.bounds.size.height * 0.1, alignment: .leading)
            Text("\(user2.name)")
                .font(.largeTitle)
                .bold()
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(blue)
                .overlay(Text("\(user2.message)"))
                .frame(width: UIScreen.main.bounds.size.width * 0.75, height: UIScreen.main.bounds.size.height * 0.1, alignment: .trailing)
                .offset(x:-30, y:0)
                .foregroundColor(cream)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(gray)
                .overlay(Text("sup shawty"))
                .frame(width: UIScreen.main.bounds.size.width * 0.75, height: UIScreen.main.bounds.size.height * 0.1, alignment: .trailing)
                .offset(x:30, y:0)
                .foregroundColor(cream)
            
            Spacer()
        }
        .padding()
    }
}

struct Previews_ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "chat")
    }
}
