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
let eggshell = Color(red: 255/255.0, green: 251/255.0, blue: 238/255.0)
let cream = Color(red: 248/255.0, green: 247/255.0, blue: 241/255.0)
//let blue = Color(red: 128/255.0, green: 206/255.0, blue: 215/255.0)
//let blue2 = Color(red: 2/255.0, green: 128/255.0, blue: 144/255.0)
//let blue3 = Color(red: 97/255.0, green: 160/255.0, blue: 175/255.0)
let blue = Color(red: 6/255.0, green: 174/255.0, blue: 213/255.0)
// Overall view
struct ContentView: View {
    
    // State for what screen to show
    @State var screen = "start"
    
    // State for database reference
    @State var ref: DatabaseReference!
    
    // State for username
    @State var username: String = ""
    
    // variables for profile
    @State var firstname: String = "John"
    @State var lastname: String = "Smith"
    @State var location: String = "Burlington, VT"
    @State var bio: String = "Looking for a roommate"
    
    var body: some View {
        // Shows screen according to boolean showFeed
        if screen == "start" {
            StartView(screen: $screen)
        } else if screen == "login" {
            LoginView(screen: $screen, ref: $ref)
        } else if screen == "signup" {
            SignUpView(screen: $screen, ref: $ref, username: $username)
        } else if screen == "feed" {
            FeedView(screen: $screen, ref: $ref)
        } else if screen == "editprofile"{
            EditProfileView(screen: $screen, firstname: $firstname, lastname: $lastname, location: $location, bio: $bio)
        } else if screen == "viewprofile" {
            PreviewProfileView(screen: $screen, firstname: $firstname, lastname: $lastname, location: $location, bio: $bio)
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
struct BottomRow: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(cream)
            .padding(0.2)
            .frame(width: 80, height: 50)
            .background(gray)
            .cornerRadius(7.0)
    }
}


