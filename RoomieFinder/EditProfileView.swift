//
//  EditProfileView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI

struct EditProfileView: View {
    // Binds showFeed to State in Content View
    @Binding var screen: String
    
    @Binding var firstname: String
    @Binding var lastname: String
    @Binding var location: String
    @Binding var bio: String
    
    var body: some View {
        // everything on the screen arranged vertically
        VStack {
            
            // buttons at the top of the screen (log out and preview profile) arranged horizontally
            HStack {
                Button("Preview Profile"){
                    self.screen = "viewprofile"
                }
                Button("Log Out"){
                    self.screen = "start"
                }
                // button formatting
                // TODO: fix formatting stuff
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8,
                       maxHeight: UIScreen.main.bounds.size.height * 0.1, alignment: .topTrailing)
                .font(.title2)
            }
            
            // text boxes to change profile
            Text("Edit Profile")
                .font(.largeTitle)
            TextField("First Name", text: $firstname)
            TextField("Last Name", text: $lastname)
            TextField("Location", text: $location)
            TextField("Bio", text: $bio)
            Spacer()
            
            // buttons at the bottom of the screen (feed, messages, profile) arranged horizontally
            HStack {
                Button("PROFILE") {
                    self.screen = "editprofile"
                }
                Button("MESSAGES") {
                    self.screen = "chat"
                }
                Button("FEED") {
                    self.screen = "feed"
                }
            }
        }
        
        // formatting for entire screen maybe?
        .textFieldStyle(defaultText())
        .padding()
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("beige"))
    }
}

struct Previews_ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "editprofile")
    }
}
