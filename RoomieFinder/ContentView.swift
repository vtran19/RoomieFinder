//
//  ContentView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/22/22.
//

import SwiftUI
import FirebaseDatabase
let gray = Color(red: 51/255.0, green: 55/255.0, blue: 69/255.0)
let pink = Color(red: 230/255.0, green: 55/255.0, blue: 191/255.0)
let orange = Color(red: 254/255.0, green: 95/255.0, blue: 85/255.0)
let eggshell = Color(red: 255/255.0, green: 247/255.0, blue: 241/255.0)
let cream = Color(red: 248/255.0, green: 247/255.0, blue: 241/255.0)
let blue = Color(red: 6/255.0, green: 174/255.0, blue: 213/255.0)

// this is how the data from firebase is stored locally
struct userSetup {
    var username: String
    var password: String
    var first: String
    var last: String
    var bio: String
    var picture: String
    var matches: Array<String>
}

// Overall view
struct ContentView: View {
    
    // State for what screen to show
    @State var screen = "start"
    
    // State for database reference
    @State var ref: DatabaseReference!
    
    // State for username
    @State var username: String = ""
    
    // set up empty user before loggin in
    @State var theUser: userSetup = userSetup(username: "null", password: "null", first: "null", last: "null", bio: "null", picture: "null", matches: ["null"])

    var body: some View {
        // Shows screen according to boolean showFeed
        if screen == "start" {
            StartView(screen: $screen)
        } else if screen == "login" {
            LoginView(screen: $screen, ref: $ref, theUser: $theUser)
        } else if screen == "signup" {
            SignUpView(screen: $screen, ref: $ref, username: $username, theUser: $theUser)
        } else if screen == "feed" {
            FeedView(screen: $screen, ref: $ref)
        } else if screen == "editprofile"{
            EditProfileView(screen: $screen, ref: $ref, theUser: $theUser)
        } else if screen == "viewprofile" {
            PreviewProfileView(screen: $screen, theUser: $theUser)
        } else if screen == "chat"{
            ChatView(screen: $screen)
        }
        else if screen == "allchats"{
            AllChatsView(screen: $screen)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

// button styling
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

// button styling
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

// button styling
struct TopIcon: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(cream)
            .padding(0.2)
            .frame(width: 80, height: 40)
            .background(blue)
            .cornerRadius(7.0)
        // / button formatting
        // TODO: fix formatting stuff
        //.frame(maxWidth: UIScreen.main.bounds.size.width * 0.8,
         //      maxHeight: UIScreen.main.bounds.size.height * 0.1, alignment: .topTrailing)
       // .font(.title2)
    }
}

// button styling

func editLocalDictionary(username: String, password: String, first: String, last: String, bio: String, picture: String, matches: Array<String>, theUser: inout userSetup) {
    // set the user's information
    theUser.username = username
    theUser.password = password
    theUser.first = first
    theUser.last = last
    theUser.bio = bio
    theUser.picture = picture
    theUser.matches = matches
}
    
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
            // ** end bottom of screen **
        }
    }
}
