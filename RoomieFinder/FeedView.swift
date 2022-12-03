/**
    Feed View Screen for Roomie Finder App that displays potential roomates' profile information
 */

import SwiftUI
import FirebaseDatabase

struct FeedView: View {
    // States
    //@State var curr: Int
    @State var users: Array<String> = []
    @State var imageIndex: Int
    @State var image: Image? = nil
    @State var ref: DatabaseReference!
    
    // Bindings
    @Binding var screen: String
    
    //@Binding var ref: DatabaseReference!
    
    // Constructor
    init() {
        
    }

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
            bottomBar(screen: $screen)
        }
        
        .padding(.horizontal)
        .padding(.top)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(cream)
    }
}

func loadImageArray(reference: DatabaseReference, username: String) -> Bool {
    var ref = reference
    ref = Database.database().reference()
    
    var users = Array<(String, String)>()
    
    // Read users and info from the database
    ref.child("users").observeSingleEvent(of: .value, with: { snapshot in
        if let usersList = snapshot.value as? NSDictionary {
            // Run through all the users
            for (user, userInfo) in usersList {
                if let currUser = user as? String {
                    // Tunneling to get user image
                    if let currInfo = userInfo as? NSDictionary {
                        if let currImage = currInfo["image"] as? String {
                            // Add user and corresponding image to tuple array
                            users.append((currUser, currImage))
                        }
                    }
                }
            }
        }
    })
    
}

struct Previews_FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "feed")
    }
}
