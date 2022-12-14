//
//  SignUpView.swift
//  RoomieFinder
//

import SwiftUI
import FirebaseDatabase

// Sign up view screen
struct SignUpView: View {
    // Initialize variables
    @State var password: String = ""
    @State var verifying: String = ""
    @State var first: String = ""
    @State var last: String = ""
    @State var location: String = ""
    
    // Bindings for variable passing
    @Binding var screen: String
    @Binding var ref: DatabaseReference!
    @Binding var username: String
    @Binding var theUser: userSetup
    
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
            
            // display the app logo
            Image("logo_plain_rectangle")
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 230.0, height: 150.0, alignment: .center)
                 .clipped()
                 .padding()
            //Text("Create an Account")
             //   .font(.largeTitle)
             //   .bold()
            
            // Username text field
            TextField("Create Username", text: $username)
            // First Name
            TextField("First Name", text: $first)
            // Last Name
            TextField("Last Name", text: $last)
            // Location text field
            TextField("Location", text: $location)
            // Password text field
            TextField("Create Password", text: $password)
            // Verify password text field
            TextField("Verify Password", text: $verifying)
            
            // If passwords match, show button
            if verify_pass(pass: password, verify: verifying) && username != "" && first != "" && last != "" && location != "" {
                // button stores data into database and lets you into the app
                Button("SIGN UP") {
                    // Assign database reference
                    self.ref = Database.database().reference()
                    
                    // Cast data to compatible values for database
                    let first = self.first as NSString
                    let last = self.last as NSString
                    let password = self.password as NSString
                    let location = self.location as NSString
                    
                    // store data into database
                    self.ref.child("users/\(self.username)/").setValue([
                        "first": first,
                        "last": last,
                        "password": password,
                        "location": location,
                        "bio": "* create your bio *",
                        "picture": self.username,
                        "matches": [:]])
                    
                    // send data to function editLocalDictionary
                    editLocalDictionary(
                        username: self.username,
                        password: self.password,
                        first: self.first,
                        last: self.last,
                        location: self.location,
                        bio: "* create your bio *",
                        picture: self.username,
                        matches: [:],
                        theUser: &theUser)
                    
                    // Change screen to feed
                    self.screen = "feed"
                }
                .buttonStyle(BlueButton())
            }
            Spacer()
        }
        // background style stuff
        .textFieldStyle(defaultText())
        .padding()
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .accentColor(Color.black)
        .background(cream)
    }
}

// Checks if passwords two user-inputed passwords match
// parameters: pass: first password, verify: second password
// returns boolean for if the strings match
func verify_pass (pass: String, verify: String)-> Bool {
    // TODO: create minimum criteria for password and validate here
    if pass == verify && pass != "" {
        return true
    } else {
        return false
    }
}

// text box styling
struct defaultText: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(width: 250)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding()
            .background()
            .cornerRadius(5.0)
    }
}

struct Previews_SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "signup")
    }
}
