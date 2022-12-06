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
            
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 130, height: 130)
            
            Text("\(theUser.first) \(theUser.last)")
                .font(.largeTitle)
            
            Text("@\(theUser.username)")
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                .border(.blue)
            Text("\(theUser.location)")
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                .border(.blue)
            Text("\(theUser.bio)")
                .frame(maxWidth: UIScreen.main.bounds.size.width * 0.8, maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
                .border(.pink)
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
