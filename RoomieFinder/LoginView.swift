/**
    Login View Screen for user login into Roomie FInder
 */

import SwiftUI
import FirebaseDatabase

// Login view screen
struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var usernames: Array<String> = []
    
    @Binding var screen: String
    @Binding var ref: DatabaseReference!
    
    var body: some View {
        VStack {
            Text("Roomie Finder")
                .font(.largeTitle)
                .bold()
            TextField("Username", text: $username)
            TextField("Password", text: $password)
                .padding(.bottom, 20)
            Button("LOG IN") {
                
                // **************
                // Assign database reference
                self.ref = Database.database().reference()
                
                // Check to make sure user is in database

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
                        if verify_user(username: username, password: password, usersList: usersList) {
                            // username and password in database -> login
                            print("Logged In");
                            self.screen = "feed"
                        } else {
                            // user does not exist, clear username and password and make them re-enter
                            // TODO: show message saying "user does not exist"
                            print("User does not exist")
                            username = ""
                            password = ""
                        }
                    } else {
                        print("Error getting users")
                    }
                })
            }
            .buttonStyle(OrangeButton())
        }
        .textFieldStyle(defaultText())
        .padding()
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .accentColor(gray)
        .background(eggshell)
    }
}

/**
    Parameters: username, password, and dictionary or users
    Function determines whether the username and password pair occurr in the dictionary
    Returns: true or false
*/
func verify_user (username: String, password: String, usersList: NSDictionary)-> Bool {
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
