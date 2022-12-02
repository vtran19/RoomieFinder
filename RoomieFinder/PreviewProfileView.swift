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
    
    var body: some View {
        VStack {
            // ** start top of screen **
            HStack (alignment: .bottom){
                // on left: log out button
                Button("Log Out"){
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
            Spacer()
            .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8,
                   maxHeight: UIScreen.main.bounds.size.height * 0.1, alignment: .topLeading)
            .font(.title2)
            Text("\(theUser.first) \(theUser.last)")
                .font(.largeTitle)
            
            Text("@\(theUser.username)")
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                .border(.blue)
            // TODO: add location to firebase?
//            Text("Location: ")
//                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
//                .border(.blue)
            Text("\(theUser.bio)")
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                .border(.pink)
            Spacer()
            // ** profile preview end **
            
            // ** start bottom of screen **
            HStack {
                // 1st: button to go to feed
                Button{
                    self.screen = "feed"
                } label: {
                    Image("feed_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70.0, height: 70.0, alignment: .center)
                }
                Spacer()
                // 2nd: button to go to chat
                Button {
                    self.screen = "allchats"
                } label: {
                    Image("chat_icon3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70.0, height: 70.0, alignment: .center)
                }
                Spacer()
                // 3rd: button to go to chat
                Button{
                    self.screen = "viewprofile"
                } label: {
                    Image("profile_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70.0, height: 70.0, alignment: .center)
                }
            }
            // ** end bottom of screen **
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
