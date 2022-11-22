//
//  SignUpView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI
import FirebaseDatabase

// Login view screen
struct SignUpView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var verifying: String = ""
    
    @Binding var screen: String
    @Binding var ref: DatabaseReference!
    
    var body: some View {
        VStack {
            // Title
            Text("Roomie Finder")
                .font(.largeTitle)
                .bold()
            // Username text field
            TextField("Create Username", text: $username)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            // Password text field
            TextField("Create Password", text: $password)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            // Verify password text field
            TextField("Verify Password", text: $verifying)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
                .background()
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            // If passwords match, store data into database
            if verify_pass(pass: password, verify: verifying) {
                Button("SIGN UP") {
                    print("Signed Up");
                    
                    // Assign database reference
                    self.ref = Database.database().reference();
                    
                    // Store password to path users/$username/password in database
                    let password = self.password as NSString;
                    self.ref.child("users/\(self.username)/").setValue(["password": password]);
                    
                    // Change screen to user profile
                    self.screen = "profile";
                    }
                .buttonStyle(BlueButton())
            }
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color.green)
    }
}

/**
    Checks if passwords two user-inputed passwords match
    - Parameters:
        - pass: first password
        - verify: second password
    - Returns boolean for if the strings match
 */
func verify_pass (pass: String, verify: String)-> Bool {
    // TODO: create minimum criteria for password and validate here
    if pass == verify && pass != "" {
        print("passwords match")
        return true
    } else {
        print("passwords do not match")
        return false
    }
}

