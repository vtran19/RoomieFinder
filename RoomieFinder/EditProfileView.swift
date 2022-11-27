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
        VStack {
            Button("Preview Profile"){
                self.screen = "viewprofile"
            }
            .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8,
                   maxHeight: UIScreen.main.bounds.size.height * 0.1, alignment: .topTrailing)
            .font(.title2)
            Text("Edit Profile")
                .font(.largeTitle)
            TextField("First Name", text: $firstname)
            TextField("Last Name", text: $lastname)
            TextField("Location", text: $location)
            TextField("Bio", text: $bio)
            Spacer()
        }
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
