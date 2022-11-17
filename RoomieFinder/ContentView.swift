//
//  ContentView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/22/22.
//

import SwiftUI
import FirebaseDatabase

// Overall view
struct ContentView: View {
    
    
    // String value for what screen to show
    @State var screen = "start"
    //var ref: DatabaseReference!
    @State var ref: DatabaseReference!
    
    var body: some View {
        // Shows screen according to boolean showFeed
        if screen == "start" {
            StartView(screen: $screen)
        } else if screen == "login" {
            LoginView(screen: $screen)
        } else if screen == "signup" {
            SignUpView(screen: $screen, ref: $ref)
        } else if screen == "feed" {
            FeedView(screen: $screen)
        } else if screen == "profile"{
            ProfileView(screen: $screen)
        } else if screen == "profile" {
            ProfileView(screen: $screen)
        } else if screen == "chat"{
            ChatView(screen: $screen)
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
            .background(Color.blue)
            .cornerRadius(10.0)
    }
}
