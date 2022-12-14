//
//  ContentView.swift
//  RoomieFinder
//

import SwiftUI
import FirebaseDatabase

// defiene colors for whole app
let gray = Color(red: 51/255.0, green: 55/255.0, blue: 69/255.0)
let pink = Color(red: 230/255.0, green: 55/255.0, blue: 191/255.0)
let orange = Color(red: 254/255.0, green: 95/255.0, blue: 85/255.0)
let eggshell = Color(red: 255/255.0, green: 247/255.0, blue: 241/255.0)
let cream = Color(red: 248/255.0, green: 247/255.0, blue: 241/255.0)
let blue = Color(red: 6/255.0, green: 174/255.0, blue: 213/255.0)

let exampleUser2 = Chat(name:"Jaden Smith", message:"Hey bestie!")

// this is how the data from firebase is stored locally
struct userSetup {
    var username: String
    var password: String
    var first: String
    var last: String
    var location: String
    var bio: String
    var picture: String
    var matches: Dictionary<String, Bool>
}

// Overall view
struct ContentView: View {
    
    // State for what screen to show
    @State var screen = "start"
    
    @State var user2: Chat = exampleUser2
    
    // Key for chat between two people
    @State var chatKey: String = ""
    
    // State for database reference
    @State var ref: DatabaseReference!
    
    // State for username
    @State var username: String = ""
    
    // State for username
    @State var messageArray: Array<(String, String)> = []
    
    // set up empty user before loggin in
    @State var theUser: userSetup = userSetup(username: "null",
                                              password: "null",
                                              first: "null",
                                              last: "null",
                                              location: "null",
                                              bio: "null",
                                              picture: "null",
                                              matches: [:])
    
    @State var image: UIImage = UIImage(imageLiteralResourceName: "profile")
    
    var body: some View {
        // Shows screen according to boolean showFeed
        if screen == "start" {
            StartView(screen: $screen)
        } else if screen == "login" {
            LoginView(screen: $screen, ref: $ref, theUser: $theUser, username: $username)
        } else if screen == "signup" {
            SignUpView(screen: $screen, ref: $ref, username: $username, theUser: $theUser)
        } else if screen == "feed" {
            FeedView(screen: $screen, ref: $ref, username: $username)
        } else if screen == "editprofile"{
            EditProfileView(screen: $screen, ref: $ref, theUser: $theUser, image: $image)
        } else if screen == "viewprofile" {
            PreviewProfileView(screen: $screen, theUser: $theUser, image: $image)
        } else if screen == "chat"{
            ChatView(screen: $screen, ref: $ref, theUser: $theUser, user2: $user2, chatKey: $chatKey, messageArray: $messageArray)
        }
        else if screen == "allchats"{
            AllChatsView(screen: $screen, theUser: $theUser, user2: $user2, ref: $ref, chatKey: $chatKey, messageArray: $messageArray)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

// blue button styling
struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 60)
            .background(blue)
            .cornerRadius(10.0)
    }
}

// orange button styling
struct ThinOrangeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 175, height: 60)
            .background(orange)
            .cornerRadius(10.0)
    }
}

// orange button styling
struct OrangeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 60)
            .background(orange)
            .cornerRadius(10.0)
    }
}

// button styling for previewprofile top buttons
struct TopIcon: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(cream)
            .padding(0.2)
            .frame(width: 80, height: 40)
            .background(blue)
            .cornerRadius(7.0)
    }
}

// stores data from firebase as a userSetup theUser which is passed to each screen
func editLocalDictionary(username: String, password: String, first: String, last: String, location: String, bio: String, picture: String, matches: Dictionary<String, Bool>, theUser: inout userSetup) {
    // set the user's information
    theUser.username = username
    theUser.password = password
    theUser.first = first
    theUser.last = last
    theUser.location = location
    theUser.bio = bio
    theUser.picture = picture
    theUser.matches = matches
}

// the bottom icon bar that appears on multiple screens to switch screens
struct bottomBar: View {
    @Binding var screen: String
    var  body: some View{
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
                self.screen = "allchats"
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
}
