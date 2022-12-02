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
        // everything on the screen is arranged vertically
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
            
            // text boxes to change profile
            Text("Edit Profile")
                .font(.largeTitle)
                .foregroundColor(gray)
            TextField("First Name", text: $firstname)
            TextField("Last Name", text: $lastname)
            TextField("Location", text: $location)
            TextField("Bio", text: $bio)
            Button("Done"){
                self.screen = "viewprofile"
            }
            .buttonStyle(TopIcon())
            .padding()
            Spacer()
        }
        // formatting for entire screen
        .textFieldStyle(defaultText())
        .padding(.horizontal)
        .padding(.top)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(cream)
    }
}

struct Previews_ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "editprofile")
    }
}
