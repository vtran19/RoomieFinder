//
//  AllChatsView.swift
//  RoomieFinder
//
//  Created by Stephanie Godes on 12/1/22.
//

import SwiftUI

struct Chat {
    var name: String
    var message: String?
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
    @Binding var theUser: userSetup
    @Binding var user2: Chat
    var emma = Chat(name: "Emma Parzyck", message: "sup shawty")
    var vanessa = Chat(name: "Vanessa Tran", message: "emma sucks lol")
    var sgodes = Chat(name: "Stephanie Godes", message: "")
    var bri = Chat(name: "Brianna Alwell", message: "i hate xcode")
   

    var body: some View {
        let chats = [emma, vanessa, sgodes, bri] // placeholder matches
        
        // iterate through users, add matches to array
        //var chats = findMatches(users: <#NSDictionary#>, theUser: theUser)
        
        
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
            
            ForEach(0..<chats.count, id: \.self) { i in
                Button {
                    self.screen = "chat"
                    self.user2 = Chat(name: chats[i].name, message: "hello")
                } label: {
                    chatPreview(person: chats[i])
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
            Text("\(person.message ?? "")")
                .frame(width: chatprev.width, height: chatprev.height, alignment: .topLeading)
                .offset(x:30, y:20)
                .foregroundColor(cream)
            
        }
    }
}


func findMatches(users: NSDictionary, theUser: userSetup) -> Array<String> {
    var usersData = Array<String>()
    
    for (user, userInfo) in users {
        if let currUser = user as? String {
            // Tunneling to get user information
            if let currInfo = userInfo as? NSDictionary {
                var username = ""
                var first = "", last = ""
                var matches = [String: Bool]()
                
                if let currFirst = currInfo["first"] as? String {
                    first = currFirst
                }
                if let currLast = currInfo["last"] as? String {
                    last = currLast
                }
                if let currUser = currInfo["username"] as? String {
                    username = currUser
                }
                var person = first + " " + last
                // load matches into the dictionary currMatches
                if let currMatches = currInfo["matches"] as? Dictionary<String, Bool> {
                    //matches = currMatches
                    // check if THEIR matches contain YOU and that it's true
                    if currMatches[theUser.username] != nil && currMatches[theUser.username] == true {
                        // check if YOUR matches contain THEM and that it's true
                        if theUser.matches[username] != nil && theUser.matches[username]  == true {
                            usersData.append(person)
                            
                        }
                    }
                }
            }
        }
    }
    return usersData
}

struct Previews_AllChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "allchats")    }
}
