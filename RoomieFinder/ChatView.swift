//
//  ChatView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI

struct ChatView: View {
    @Binding var screen: String
    var body: some View {
        VStack {
            // ** start top of screen **
            HStack (alignment: .bottom){
                // in the middle: roomiefinder logo
                Image("logo_plain_rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130.0, height: 85.0, alignment: .center)
                    .clipped()
            }
            // ** end top of screen **
            
            Spacer()
            Text("chat")
                .font(.largeTitle)
                .bold()
            Spacer()
            
            // ** start bottom of screen **
            HStack {
                // 1st: button to go to feed
                Button{
                    self.screen = "feed"
                } label: {
                    Image("feed_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70.0, height: 70.0, alignment: .center)
                }
                Spacer()
                // 2nd: button to go to chat
                Button {
                    self.screen = "chat"
                } label: {
                    Image("chat_icon3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70.0, height: 70.0, alignment: .center)
                }
                Spacer()
                // 3rd: button to go to chat
                Button{
                    self.screen = "viewprofile"
                } label: {
                    Image("profile_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70.0, height: 70.0, alignment: .center)
                }
            }
            // ** end bottom of screen **
        }
        .padding(.horizontal)
        .padding(.top)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(cream)
    }
}

struct Previews_ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "chat")
    }
}
