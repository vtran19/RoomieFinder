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
            Button("HOME") {
                self.screen = "login"
            }
            Button("PROFILE") {
                self.screen = "editprofile"
            }
            Button("LIKE") {
                //TODO: Increment users array by 1, get username, get picture from user, change image
            }
        }
        .buttonStyle(BlueButton())
        .padding()
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("beige"))
    }
}

struct Previews_FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "feed")
    }
}
