/**
    Login View Screen for user login into Roomie FInder
 */

import SwiftUI
import FirebaseDatabase

// Login view screen
struct LoginView: View {
    @State var usernameLogIn: String = ""
    @State var password: String = ""
    @State var usernames: Array<String> = []
    @State var errorMsg: String = ""
    
    @Binding var screen: String
    @Binding var ref: DatabaseReference!
    @Binding var theUser: userSetup
    @Binding var username: String
    
    var body: some View {
        VStack {
            // Back Button
            Button {
                self.screen = "start"
            } label: {
                Image("back")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.size.width * 0.05,
                           maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .trailing)
                Text("Back")
                    .frame(maxWidth: UIScreen.main.bounds.size.width * 0.9,
                           maxHeight: UIScreen.main.bounds.size.height * 0.05, alignment: .leading)
            }
            
            Image("logo_with_name")
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 250.0, height: 250.0, alignment: .center)
                 .clipped()
            TextField("Username", text: $usernameLogIn)
            TextField("Password", text: $password)
                .padding(.bottom, 20)
            Button("LOG IN") {
                
                // **************
                // Assign database reference
                self.ref = Database.database().reference()
                
                // read all users from database
                ref.child("users").observeSingleEvent(of: .value, with: { snapshot in
                    // set the database users to the optional NSDictionary usersList
                    if let usersList = snapshot.value as? NSDictionary{
                        print("Got users successfully")

                        // ** for testing **
                        // loop through usersList and print the users and their info
                        for (username, userInfo) in usersList {
                            print("Username: \(username)\nInformation: \(userInfo)")
                        }
                        // ** done testing **
                        
                        // call function verify_user to check if user exists
                        if verify_user(username: usernameLogIn, password: password, usersList: usersList, theUser: &theUser) {
                            // username and password in database -> login
                            print("Logged In")
                            self.username = usernameLogIn
                            self.screen = "feed"
                        }
                        else {
                            // user does not exist, clear username and password and make them re-enter
                            // TODO: show message saying "user does not exist"
                            errorMsg = "User does not exist. Please double-check your login information and try again."
                            print("User does not exist")
                            usernameLogIn = ""
                            password = ""
                        }
                    }
                    else {
                        errorMsg = "Error retrieving users from database"
                    }
                })
            }
            .buttonStyle(OrangeButton())
            Text("\(errorMsg)")
            Spacer()
        }
        .textFieldStyle(defaultText())
        .padding()
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .accentColor(gray)
        .background(cream)
    }
}

/**
    Parameters: username, password, and dictionary or users
    Function determines whether the username and password pair occurr in the dictionary
    Returns: true or false
*/
func verify_user (username: String, password: String, usersList: NSDictionary, theUser: inout userSetup)-> Bool {
    // look through usersList to see if the user exists
    var userFound = false
    for (user, userInfo) in usersList {
        // try to create optional String currUser from user (type=Any)
        if let currUser = user as? String {
            // check if username entered matches this user's username
            if username == currUser {
                // if the username is correct, check the password
                // try to create optional dictionary currInfo from userInfo (type=Any)
                if let currInfo = userInfo as? NSDictionary{
                    // try to create optional String currPassword from the the entry in currInfo (type=NSDictionary) at key "password"
                    if let currPassword = currInfo["password"] as? String {
                        // check if password entered matches this user's password
                        if password == currPassword {
                            // if password correct, we found our user
                            userFound = true
                            // make sure all the elements can be unwrapped, then send to function editLocalDictionary
                            if let first = currInfo["first"] as? String,
                               let last = currInfo["last"] as? String,
                               let location = currInfo["location"] as? String,
                               let bio = currInfo["bio"] as? String,
                               let picture = currInfo["picture"] as? String,
                               let matches = currInfo["matches"] as? Dictionary<String, Bool> {
                                editLocalDictionary(
                                    username: username,
                                    password: password,
                                    first: first,
                                    last: last,
                                    location: location,
                                    bio: bio,
                                    picture: picture,
                                    matches: matches,
                                    theUser: &theUser)
                            }
                            else {
                                print("could not load user info")
                            }
                        }
                    }
                }
            }
        }
    }
    return userFound
}

struct Previews_LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "login")
    }
}

