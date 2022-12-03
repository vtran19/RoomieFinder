//
//  EditProfileView.swift
//  RoomieFinder
//
//  Created by user228000 on 10/24/22.
//

import SwiftUI
import FirebaseDatabase

struct EditProfileView: View {
    // Binds showFeed to State in Content View
    @Binding var screen: String
    @Binding var ref: DatabaseReference!
    @Binding var theUser: userSetup
    
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
            TextField("First Name", text: $theUser.first)
            TextField("Last Name", text: $theUser.last)
            // TODO: location
            //TextField("Location", text: "location")
            TextField("Bio", text: $theUser.bio)
            
            Button("Done"){
                // reassign everything to firebase
                // Assign database reference
                self.ref = Database.database().reference()
                
                // cast data to compatible values for database
                //let first = theUser.first as NSString
                //let last = theUser.last as NSString
                //let bio = theUser.bio as NSString
                // put info back into firebase
                // TODO: how to change individual fields in database
                //self.ref.child("users/\(theUser.username)/").setValue(["first": first, "last": last, "bio": bio])
                
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
