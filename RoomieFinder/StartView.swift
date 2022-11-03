//
//  StartView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI

// Login view screen
struct StartView: View {
    @Binding var screen: String
    
    var body: some View {
        VStack {
            Button(action: {
                self.screen = "login"
                }) {
                ToLogin()
            }
            Button(action: {
                self.screen = "sign up"
                }) {
                ToSignUp()
            }
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color.green)
    }
}

// Login button styling
struct ToLogin : View {
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

struct ToSignUp : View {
    var body: some View {
        return Text("SIGN UP")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(10.0)
    }
}

