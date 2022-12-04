/**
    Feed View Screen for Roomie Finder App that displays potential roomates' profile information
 */

import SwiftUI
import FirebaseDatabase

struct FeedView: View {
    //var users = Array<userSetup>()
    // States
    @State var isLoaded: Bool = false
    @State var imageIndex: Int = 0
    @State var ref: DatabaseReference!
    
    // Bindings
    @Binding var screen: String
    @Binding var allUsers: Array<userSetup>
    //@Binding var ref: DatabaseReference!
    

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
            
            // If data is not loaded, show a button to start matching
            if (self.isLoaded == false) {
                Button("Start Matching!") {
                    self.ref = Database.database().reference()
                    
                    // Read users and info from the database
                    ref.child("users").observeSingleEvent(of: .value, with: { snapshot in
                        if let usersList = snapshot.value as? NSDictionary {
                            // Fill array with data from database
                            self.allUsers = storeData(users: usersList)
                        }
                    });
                    
                    print(self.allUsers.count)
                    self.isLoaded = true
                }
                .buttonStyle(BlueButton())
            } else {
                // If current image index equals the amount of users on app, print message to user
                if (self.imageIndex >= self.allUsers.count) {
                    Text("There is no one in your area to match with")
                } else {
                    // Show images of users on app
                    Image(self.allUsers[imageIndex].picture)
                    .resizable()
                    Button("LIKE") {
                        if (self.imageIndex < self.allUsers.count) {
                            self.imageIndex += 1
                        }
                        
                        // TODO: add username to matches using struct data
                        
                        // TODO: Firebase
                            
                        // Testing
                        print(self.imageIndex)
                       // print("user: \(self.allUsers[imageIndex].username)")
                    }
                    .buttonStyle(BlueButton())
                    
                }
                
            }
            
            // Bottom of screen
            Spacer()
            bottomBar(screen: $screen)
        }
        
        .padding(.horizontal)
        .padding(.top)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(cream)
    }
}
func storeData(users: NSDictionary) -> Array<userSetup> {
    var usersData = Array<userSetup>()
    
    for (user, userInfo) in users {
        if let currUser = user as? String {
            // Tunneling to get user information
            if let currInfo = userInfo as? NSDictionary {
                var image = "", bio = "", first = "", last = "", matches = "", pass = ""
                if let currImage = currInfo["picture"] as? String {
                    image = currImage
                }
                if let currBio = currInfo["bio"] as? String {
                    bio = currBio
                }
                if let currFirst = currInfo["first"] as? String {
                    first = currFirst
                }
                if let currLast = currInfo["last"] as? String {
                    last = currLast
                }
                if let currMatches = currInfo["matches"] as? String {
                    matches = currMatches
                }
                if let currPass = currInfo["password"] as? String {
                    pass = currPass
                }
                let userToAdd = userSetup(username: currUser, password: pass, first: first, last: last, bio: bio, picture: image, matches: matches)
                usersData.append(userToAdd)
            }
        }
    }
    print(usersData)
    return usersData
}

func loadImageArray(reference: DatabaseReference, username: String) -> Array<userSetup> {
    var ref = reference
    ref = Database.database().reference()
    
    var users = Array<userSetup>()
    
    // Read users and info from the database
    ref.child("users").observeSingleEvent(of: .value, with: { snapshot in
        if let usersList = snapshot.value as? NSDictionary {
            // Run through all the users
            users = storeData(users: usersList)
        }
    });
    print(users)
    return users
}

//struct Previews_FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(screen: "feed")
//    }
//}
