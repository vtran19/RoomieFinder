/**
    Feed View Screen for Roomie Finder App that displays potential roomates' profile information
 */

import SwiftUI
import FirebaseDatabase

struct FeedView: View {
    
    // States
    @State var isLoaded: Bool = false
    @State var imageIndex: Int = 0
    @State var allUsers: Array<userSetup> = []
    
    // Bindings
    @Binding var screen: String
    @Binding var ref: DatabaseReference!
    @Binding var username: String
    

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
                Spacer()
                Text("Welcome to your feed! Click below to start finding roommates")
                    .font(.system(.largeTitle, design: .rounded).weight(.light))
                    .tracking(3.5)
                    .foregroundColor(gray)
                    .multilineTextAlignment(.center)
                
                Button("Start Matching!") {
                    self.ref = Database.database().reference()
                    
                    // Read users and info from the database
                    ref.child("users").observeSingleEvent(of: .value, with: { snapshot in
                        if let usersList = snapshot.value as? NSDictionary {
                            // Fill array with data from database
                            self.allUsers = storeData(users: usersList)
                            
                            // Removes current user of app from list of potential roommates
                            var userIndex: Int = -1
                            
                            // Find index of username
                            for (index, element) in self.allUsers.enumerated() {
                                if (element.username == self.username) {
                                    userIndex = index
                                }
                            }
                            
                            // Only remove if user is found in list
                            if (userIndex != -1) {
                                self.allUsers.remove(at: userIndex)
                            }
                        }
                    });
                    
                    // Data is loaded
                    self.isLoaded = true
                }
                .buttonStyle(OrangeButton())
            } else {
                // If current image index equals the amount of users on app, print message to user
                if (self.imageIndex >= self.allUsers.count) {
                    Text("There is no one in your area to match with")
                } else {
                    // Show images of users on app
                    Image(self.allUsers[imageIndex].picture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 370, height: 500)
                        .cornerRadius(15)
                        .clipped()
                        .overlay(
                            Group {
                                VStack {
                                    // Print user bio and name at the bottom left of the screen
                                    Text("\(self.allUsers[imageIndex].first) \(self.allUsers[imageIndex].last)")
                                        .font(.title)
                                        .foregroundColor(.white)
                                    Text("\(self.allUsers[imageIndex].bio)")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                            },
                            alignment: .bottomLeading
                        )
                    HStack {
                        
                        
                        // Dislike button
                        Button("DISLIKE") {
                            // Fetch username that user disliked
                            let userMatch = self.allUsers[imageIndex].username
                            
                            // Unwrap username from binding to use in path for DB
                            let userPath = $username.wrappedValue
                            
                            // Set match for this profile to false for current user
                            self.ref.child("users/\(userPath)/matches/\(userMatch)").setValue(false)
                            
                            // Increment index
                            if (self.imageIndex < self.allUsers.count) {
                                self.imageIndex += 1
                            }
                        }
                        .buttonStyle(OrangeButton())
                        
                        // Like button
                        Button("LIKE") {
                            // Fetch username that user liked
                            let userMatch = self.allUsers[imageIndex].username
                            
                            // Unwrap username from binding to use in path for DB
                            let userPath = $username.wrappedValue
                            
                            // Set match for this profile to true for current user
                            self.ref.child("users/\(userPath)/matches/\(userMatch)").setValue(true)
                            
                            // If imageIndex is less than all users,increment and move to next person
                            if (self.imageIndex < self.allUsers.count) {
                                self.imageIndex += 1
                            }
                        }
                        .buttonStyle(OrangeButton())
                        
                    }
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
                var image = "", bio = "", location = "", first = "", last = "", pass = ""
                var matches = [String: Bool]()
                if let currImage = currInfo["picture"] as? String {
                    image = currImage
                }
                if let currBio = currInfo["bio"] as? String {
                    bio = currBio
                }
                if let currLoc = currInfo["location"] as? String {
                    location = currLoc
                }
                if let currFirst = currInfo["first"] as? String {
                    first = currFirst
                }
                if let currLast = currInfo["last"] as? String {
                    last = currLast
                }
                if let currMatches = currInfo["matches"] as? Dictionary<String, Bool> {
                    matches = currMatches
                }
                if let currPass = currInfo["password"] as? String {
                    pass = currPass
                }
                let userToAdd = userSetup(username: currUser, password: pass, first: first, last: last, location: location, bio: bio, picture: image, matches: matches)
                usersData.append(userToAdd)
            }
        }
    }
    print(usersData)
    return usersData
}

struct Previews_FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "feed")
    }
}
