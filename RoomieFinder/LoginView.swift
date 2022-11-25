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
            Button("LOG IN") {
                //TODO: add logic for authentication here or function
                print("Logged In");
                self.screen = "feed"
            }
            .buttonStyle(BlueButton())
        }
        .textFieldStyle(defaultText())
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color.green)
    }
}

struct Previews_LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: "login")
    }
}
