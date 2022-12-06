//
//  PreviewProfileView.swift
//  RoomieFinder
//
//  Created by Stephanie Godes on 11/25/22.
//
import SwiftUI
import FirebaseDatabase

struct PreviewProfileView: View {
    @Binding var screen: String
    @Binding var theUser: userSetup
    @Binding var image: UIImage
    
    var body: some View {
        VStack {
            // ** start top of screen **
            HStack (alignment: .bottom){
                // on left: log out button
                Button("Log Out"){
                    self.theUser = userSetup(username: "null",
                                             password: "null",
                                             first: "null",
                                             last: "null",
                                             location: "null",
                                             bio: "null",
                                             picture: "null",
                                             matches: [:])
                    self.screen = "start"
                }
                .buttonStyle(TopIcon())
                Spacer()
                // in the middle: roomiefinder logo
                Image("logo_plain_rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130.0, height: 85.0, alignment: .center)
                    .clipped()
                Spacer()
                // on the right: button to edit profile
                Button {
                    self.screen = "editprofile"
                } label: {
                    Label("Edit", systemImage: "pencil")
                }
                .buttonStyle(TopIcon())
            }
            // ** end top of screen **
            
            // ** profile preview start **
            .padding(.bottom, 25.0)
            
            // changed to username
            Image(theUser.username)
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 130)
                .clipShape(Circle())
                
            Text("@\(theUser.username)")
                .font(.largeTitle)
                
            
            Text("\(theUser.first) \(theUser.last)")
                .font(.system(size: 20))
                .padding(20)
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, minHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                .background(orange.opacity(0.75))
                .cornerRadius(10)
            
            Text("\(theUser.location)")
                .font(.system(size: 20))
                .padding(18)
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, minHeight: UIScreen.main.bounds.size.height * 0.05,  alignment: .leading)
                .background(orange.opacity(0.75))
                .cornerRadius(10)
            Text("\(theUser.bio)")
                .font(.system(size: 20))
                .padding(20)
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, minHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                .background(orange.opacity(0.75))
                .cornerRadius(10)
                
            Spacer()
            // ** profile preview end **
            
            bottomBar(screen: $screen)
        }
        .padding(.horizontal)
        .padding(.top)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("beige"))
    }
}

struct Previews_PreviewProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "viewprofile")
    }
}
