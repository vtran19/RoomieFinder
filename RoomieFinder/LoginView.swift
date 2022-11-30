/**
    Login View Screen for user login into Roomie FInder
 */

import SwiftUI

// Login view screen
struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @Binding var screen: String
    
    var body: some View {
        VStack {
            Text("Roomie Finder")
                .font(.largeTitle)
                .bold()
            TextField("Username", text: $username)
            TextField("Password", text: $password)
                .padding(.bottom, 20)
            Button("LOG IN") {
                //TODO: add logic for authentication here or function
                print("Logged In");
                self.screen = "feed"
            }
            .buttonStyle(OrangeButton())
        }
        .textFieldStyle(defaultText())
        .padding()
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .accentColor(gray)
        .background(mint)
    }
}

struct Previews_LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "login")
    }
}
