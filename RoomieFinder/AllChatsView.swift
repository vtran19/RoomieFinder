//
//  AllChatsView.swift
//  RoomieFinder
//
//  Created by Stephanie Godes on 12/1/22.
//

import SwiftUI
import FirebaseDatabase

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
    // State for data loading
    @State var isLoaded: Bool = false
    @State var chats: Array<Chat> = []
    @State var matches: Array<String> = []
    
    // Binding
    @Binding var screen: String
    @Binding var theUser: userSetup
    @Binding var user2: Chat
    @Binding var ref: DatabaseReference!
    
    // Default chat values
    var emma = Chat(name: "Emma Parzyck", message: "sup shawty")
    var vanessa = Chat(name: "Vanessa Tran", message: "emma sucks lol")
    var sgodes = Chat(name: "Stephanie Godes", message: "")
    var bri = Chat(name: "Brianna Alwell", message: "i hate xcode")
    
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
            if (self.isLoaded) {
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
            } else {
                Button("Chat with Matches!") {
                    self.ref = Database.database().reference()
                    
                    // Unwrap binding for current user
                    let currentUser = $theUser.wrappedValue
                    print("Curr User Button: \(currentUser)")
                    
                    // Read users and info from the database
                    ref.child("users").observeSingleEvent(of: .value, with: { snapshot in
                        if let usersList = snapshot.value as? NSDictionary {
                            // Fill array with data from database
                            print("Users List: \(usersList)")
                            self.matches = findMatches(users: usersList, theUser: currentUser)
                            
                            for person in self.matches {
                                let toAdd = Chat(name: person, message: "default")
                                self.chats.append(toAdd)
                            }
                        }
                    });
                    
                    // Data is loaded
                    self.isLoaded = true
                }
                .buttonStyle(OrangeButton())
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
                var first = "", last = ""
                
                if let currFirst = currInfo["first"] as? String {
                    first = currFirst
                }
                if let currLast = currInfo["last"] as? String {
                    last = currLast
                }
                
                // load matches into the dictionary currMatches
                if let currMatches = currInfo["matches"] as? Dictionary<String, Bool> {
                    print("Matches: \(currMatches)")
                    // loop through user in database's matches to see if it matches user of app
                    for (matchUser, isMatch) in currMatches {
                        // find current user of app within database user matches and check if the match is true
                        print("Curr User: \(theUser.username)")
                        if matchUser == theUser.username && isMatch == true {
                            // loop through user of app matches and check if they match with that user
                            for (matchUserOther, isMatchOther) in theUser.matches {
                                if matchUserOther == currUser && isMatchOther == true {
                                    
                                    // if users both have matches for each other, append to array
                                    let person = first + " " + last
                                    usersData.append(person)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    print(usersData)
    return usersData
}

struct Previews_AllChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "allchats")    }
}
