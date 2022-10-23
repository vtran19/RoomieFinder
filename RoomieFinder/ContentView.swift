//
//  ContentView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/22/22.
//

import SwiftUI

// Overall view
struct ContentView: View {
    @State var showFeed = false
    var body: some View {
        if showFeed == false {
            LoginView2(showFeed: $showFeed)
        } else {
            FeedScreen()
        }
        
    }
    
}

// Login view screen
struct LoginView2: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @Binding var showFeed: Bool
    
    var body: some View {
        VStack {
            Text("Roomie Finder")
                .font(.largeTitle)
                .bold()
            TextField("Username", text: $username)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Password", text: $password)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: {
                //TODO: add logic for authentication here or function
                print("Logged In")
                self.showFeed = true
                }) {
                LoginButton()
            }
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color.green)
    }
}

// Login button styling
struct LoginButton : View {
    var body: some View {
        return Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(10.0)
    }
}

struct FeedScreen: View {
    var body: some View {
        VStack {
            Text("You logged in!")
                .bold()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
