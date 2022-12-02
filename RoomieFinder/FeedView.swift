/**
    Feed View Screen for Roomie Finder App that displays potential roomates' profile information
 */

import SwiftUI
import FirebaseDatabase

struct FeedView: View {
    // States
    //@State var curr: Int
    @State var users: Array<String>
    @State var image: Image? = nil
    @State var ref: DatabaseReference!
    
    // Bindings
    @Binding var screen: String
    
    //@Binding var ref: DatabaseReference!
    
    // Constructor
    init() {
        // Initialize database connection
        let localRef = Database.database().reference()
        var list = [String]()
        var temp = "feed"
        let currScreen = Binding<String>(get: { temp }, set: { temp = $0})
        
        // Get users in database
        localRef.child("users").observeSingleEvent(of: .value, with: { snapshot in
            if let usersList = snapshot.value as? NSDictionary {
                //list = usersList as! [String]
                print("Got users successfully")
            } else {
                print("Error getting users")
            }
        })
        
        // Set the current user to the first user in array
        print(list)
        let currUser = list[0]
        var currPic = ""
        
        // Get the picture name from database
        localRef.child("users").child(currUser).observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            let picture = value?["picture"] as? String ?? ""
            currPic = picture
        })
        
        self.users = list
        self.image = Image(currPic)
        self.ref = localRef
        self._screen = currScreen
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

func loadFeed() {
    
}

struct Previews_FeedView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "feed")
    }
}
