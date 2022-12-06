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
    
    @State private var isShowPhotoLibrary = false
    @Binding var image: UIImage
    
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
            
            Image(theUser.username)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 130, height: 130)
            
            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
                HStack {
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                    
                    Text("Photo library")
                        .font(.headline)
                }
                .buttonStyle(BlueButton())
            }
        
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        
        
        TextField("First Name", text: $theUser.first)
        TextField("Last Name", text: $theUser.last)
        TextField("College", text: $theUser.location)
        TextField("Bio", text: $theUser.bio)
        
        Button("Done"){
            // reassign everything to firebase
            // Assign database reference
            self.ref = Database.database().reference()
            
            // cast data to compatible values for database
            let first = theUser.first as NSString
            let last = theUser.last as NSString
            let location = theUser.location as NSString
            let bio = theUser.bio as NSString
            // put info back into firebase
            self.ref.child("users/\(theUser.username)/first").setValue(first)
            self.ref.child("users/\(theUser.username)/last").setValue(last)
            self.ref.child("users/\(theUser.username)/location").setValue(location)
            self.ref.child("users/\(theUser.username)/bio").setValue(bio)
            
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
