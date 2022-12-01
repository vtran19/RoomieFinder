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
            // Back Button
            Button {
                self.screen = "feed"
            } label: {
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: screenWidth * 0.05,
                           maxHeight: screenHeight * 0.05, alignment: .trailing)
                Text("Back")
                    .frame(maxWidth: screenWidth * 0.9,
                           maxHeight: screenHeight * 0.05, alignment: .leading)
                    .accentColor(gray)
            }
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
        }
        .padding()
    }
}

struct Previews_AllChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "allchats")    }
}
