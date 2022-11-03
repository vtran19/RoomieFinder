//
//  SignUpView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI

// Login view screen
struct SignUpView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var verifying: String = ""
    
    @Binding var screen: String
    
    var body: some View {
        VStack {
            Text("Roomie Finder")
                .font(.largeTitle)
                .bold()
            TextField("Create Username", text: $username)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Create Password", text: $password)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            TextField("Verify Password", text: $verifying)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            if verify_pass(pass: password, verify: verifying) {
                Button(action: {
                    //TODO: add logic for authentication here or function
                    print("Signed Up")
                    self.screen = "profile"
                    }) {
                    SignUpButton()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color.green)
    }
}

// Login button styling
struct SignUpButton : View {
    var body: some View {
        return Text("SIGNUP")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(10.0)
    }
}

func verify_pass (pass: String, verify: String)-> Bool {
    if pass == verify {
        print("passwords match")
        return true
    } else {
        print("passwords do not match")
        return false
    }
}

