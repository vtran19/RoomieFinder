//
//  AllChatsView.swift
//  RoomieFinder
//
//  Created by Stephanie Godes on 12/1/22.
//

import SwiftUI

struct Chat {
    var name: String
    var message: String
}

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

struct FrameSize {
    var width: Double
    var height: Double
}

let emma = Chat(name: "Emma Parzyck", message: "sup shawty")

let chatframe = FrameSize(width: screenWidth * 0.75, height: screenHeight * 0.1)
let chatprev = FrameSize(width: screenWidth * 0.4, height: screenHeight * 0.05)
let chatprof = FrameSize(width: screenWidth * 0.15, height: screenHeight * 0.1)


struct AllChatsView: View {
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
            Text("Chats")
                .font(.largeTitle)
                .bold()
            
            
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(eggshell)
                    .frame(width: chatframe.width, height: chatframe.height)
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: chatprof.width,
                           height: chatprof.height, alignment: .leading)
                    .offset(x:-100, y:0)
                Text("\(emma.name)").bold()
                    .frame(width: chatprev.width, height: chatprev.height, alignment: .leading)
                    .offset(x:30, y:-20)
                Text("\(emma.message)")
                    .frame(width: chatprev.width, height: chatprev.height, alignment: .topLeading)
                    .offset(x:30, y:20)
                
            }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(eggshell)
                    .frame(width: chatframe.width, height: chatframe.height)
                Circle()
                    .foregroundColor(.pink)
                    .frame(width: chatprof.width,
                           height: chatprof.height, alignment: .leading)
                    .offset(x:-100, y:0)
                Text("Vanessa Tran").bold()
                    .frame(width: chatprev.width, height: chatprev.height, alignment: .leading)
                    .offset(x:30, y:-20)
                Text("sup shawty")
                    .frame(width: chatprev.width, height: chatprev.height, alignment: .topLeading)
                    .offset(x:30, y:20)
                
            }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(eggshell)
                    .frame(width: chatframe.width, height: chatframe.height)
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: chatprof.width,
                           height: chatprof.height, alignment: .leading)
                    .offset(x:-100, y:0)
                Text("Brianna Alwell").bold()
                    .frame(width: chatprev.width, height: chatprev.height, alignment: .leading)
                    .offset(x:30, y:-20)
                Text("sup shawty")
                    .frame(width: chatprev.width, height: chatprev.height, alignment: .topLeading)
                    .offset(x:30, y:20)
                
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

struct Previews_AllChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "allchats")    }
}
