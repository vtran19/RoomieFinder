//
//  AllChatsView.swift
//  RoomieFinder
//
//  Created by Stephanie Godes on 12/1/22.
//

import SwiftUI

struct Chat {
    var username: String
    var name: String
    var message: String
}

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

struct FrameSize {
    var width: Double
    var height: Double
}

let chatframe = FrameSize(width: screenWidth * 0.75, height: screenHeight * 0.1)
let chatprev = FrameSize(width: screenWidth * 0.4, height: screenHeight * 0.05)
let chatprof = FrameSize(width: screenWidth * 0.15, height: screenHeight * 0.1)



struct AllChatsView: View {
    @Binding var screen: String
    @Binding var user2: Chat
    var emma = Chat(username: "emparz", name: "Emma Parzyck", message: "sup shawty")
    var vanessa = Chat(username: "vtran", name: "Vanessa Tran", message: "emma sucks lol")
    var sgodes = Chat(username: "sgodes", name: "Stephanie Godes", message: "yeehaw")
    
   

    var body: some View {
        var matches = [emma, vanessa, sgodes]
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
            Text("Chats")
                .font(.largeTitle)
                .bold()
            
            ForEach(0..<matches.count, id: \.self) { i in
                Button {
                    self.screen = "chat"
                    self.user2 = matches[i]
                } label: {
                    chatPreview(person: matches[i])
                }
            }
            Spacer()
            
            bottomBar(screen: $screen)
        }
        .padding(.horizontal)
        .padding(.top)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(cream)
    }
}

struct chatPreview: View {
    var person: Chat
    var  body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(blue)
                .frame(width: chatframe.width, height: chatframe.height)
            Circle()
                .foregroundColor(pink)
                .frame(width: chatprof.width,
                       height: chatprof.height, alignment: .leading)
                .offset(x:-100, y:0)
            Text("\(person.name)").bold()
                .frame(width: chatprev.width, height: chatprev.height, alignment: .leading)
                .offset(x:30, y:-20)
                .foregroundColor(cream)
            Text("\(person.message)")
                .frame(width: chatprev.width, height: chatprev.height, alignment: .topLeading)
                .offset(x:30, y:20)
                .foregroundColor(cream)
            
        }
    }
}

struct Previews_AllChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "allchats")    }
}
