//
//  ChatView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI
import FirebaseDatabase

struct ChatView: View {
    @Binding var screen: String
    @Binding var ref: DatabaseReference!
    @Binding var theUser: userSetup
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
            
            // get the chat from firebase
            // Assign database reference
           // self.ref = Database.database().reference()
            //convos = get_chats(theUser.username, user2.username2, allChats: NSDictionary)
            
            
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
//            Button("send") {
//                // add your message
//                guard let key = ref.child("chats").childByAutoId().key else { return }
//                //let chat = ["message": body]
//                //let childUpdates = ["/posts/\(key)": post,
//                //"/user-posts/\(userID)/\(key)/": post]
//
//
//
//                // Cast data to compatible values for database
//                let first = self.first as NSString
//                let last = self.last as NSString
//                let password = self.password as NSString
//                let location = self.location as NSString
//
//                // store data into database
//                self.ref.child("users/\(self.username)/").setValue([
//                    "first": first,
//                    "last": last,
//                    "password": password,
//                    "locaiton": location,
//                    "bio": "* create your bio *",
//                    "picture": self.username,
//                    "matches": [:]])
//            }
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

//func get_chats(username: String, username2: String, allChats: NSDictionary)-> NSDictionary {
//    // create an array and sort it alphabetically
//    var alphabetical = [username, username2]
//    alphabetical = alphabetical.sorted { (u1, u2) -> Bool in
//        return (u1.localizedCaseInsensitiveCompare(u2) == .orderedAscending)
//    }
//    // the key for messages is the alphabetical usernames concatinated
//    let usernamesKey = username + username2
//    
//    // chatInfo has a list of messages within which are a name, messageText, and timestamp
//    for (key, chatInfo) in allChats {
//        // try to create optional String currKey from key
//        if let currKey = key as? String {
//            // see if it matches the key we just made
//            if currKey == usernamesKey {
//                let conversation = chatInfo as? NSDictionary
//            }
//        }
//    }
//}
    
struct Message {
    let name: String
    let text: String
    let timestamp: Float
}

struct Previews_ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "chat")
    }
}
