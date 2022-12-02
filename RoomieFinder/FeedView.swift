/**
    Feed View Screen for Roomie Finder App that displays potential roomates' profile information
 */

import SwiftUI
import FirebaseDatabase

struct FeedView: View {
    // States
    //@State var curr: Int
    //@State var users: NSArray
    @State var image: Image? = nil
    
    // Bindings
    @Binding var screen: String
    @Binding var ref: DatabaseReference!

    var body: some View {
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
            
            Text("Roomie Finder")
                .font(.largeTitle)
                .bold()
            Spacer()
            if (image == nil) {
                Text("There is no one in your area to match with")
            } else {
                image?
                .resizable()
                .frame(width: 150, height: 150)
            }
            
            Text("You logged in! This is your feed.")
                .bold()
            Button("LIKE") {
                //TODO: Increment users array by 1, get username, get picture from user, change image
            }
            .buttonStyle(BlueButton())
            Spacer()
            
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
        .background(cream)
    }
}

struct Previews_FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "feed")
    }
}
