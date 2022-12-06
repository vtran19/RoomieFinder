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
    @Binding var chatKey: String
    
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
                    recievedChatbubble(message: "hello world")
                    sentChatbubble(message: "sup")
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
//            Button("send") {
//                // add your message
//                guard let key = ref.child("chats").childByAutoId().key else { return }
//                //let chat = ["message": body]
//                //let childUpdates = ["/posts/\(key)": post,
//                //"/user-posts/\(userID)/\(key)/": post]
//
//            }
        }
        .background(cream)
    }
}

struct recievedChatbubble: View{
    var message: String = ""
    var  body: some View{
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(gray.opacity(0.25))
            .overlay(Text("\(message)"))
            .foregroundColor(.black)
            .frame(maxWidth:UIScreen.main.bounds.size.width * 0.6, minHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .trailing)
            .offset(x:-30, y:0)
    }
}

struct sentChatbubble: View{
    var message: String = ""
    var  body: some View{
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(orange.opacity(0.25))
            .overlay(Text("\(message)"))
            .foregroundColor(.black)
            .frame(maxWidth: UIScreen.main.bounds.size.width * 0.6, minHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .trailing)
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
