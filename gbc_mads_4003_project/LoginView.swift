//
//  LoginView.swift
//  gbc_mads_4003_project
//
//  Created by user on 2025-10-03.
//

//log in screen
import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    
    @State private var showLoginAlert: Bool = false
    
    @State private var path = NavigationPath()
    @State private var loggedIn: Bool = false
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Login")
                    .font(.title)
                
                Form {
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                    
                    Toggle(isOn: $rememberMe) {
                        Text("Remember Me")
                    }
                    
                    Button {
                        let user = LoginManager.login(email: email, password: password)
                        
                        if (user != nil) {
                            if let encodedUser = try? JSONEncoder().encode(user) {
                                if (rememberMe) {
                                    defaults.set(encodedUser, forKey: "user")
                                } else {
                                    defaults.removeObject(forKey: "user")
                                    email = ""
                                    password = ""
                                }
                                defaults.set(encodedUser, forKey: "currentUser")
                                defaults.set(rememberMe, forKey: "rememberMe")
                                
                                loggedIn = true
                            }
                        } else {
                            showLoginAlert = true
                        }
                    } label: {
                        Text("Login")
                            .font(.headline)
                    }
                    .buttonStyle(.borderedProminent)
                    .alert(isPresented: $showLoginAlert) {
                        Alert(title: Text("Login failed"),
                              message: Text("Incorrect email or password"),
                              dismissButton: .default(Text("OK"))
                        )
                    }
                }
                
                Spacer()
            }
            .padding()
            .onAppear() {
                defaults.removeObject(forKey: "currentUser")
                if let savedUser = defaults.data(forKey: "user"), let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser) {
                    email = decodedUser.email
                    password = decodedUser.password
                }
                
                rememberMe = UserDefaults.standard.bool(forKey: "rememberMe")
            }
            .navigationDestination(isPresented: $loggedIn) {
                SessionsListScreen()
            }
            .navigationBarTitle("Logout", displayMode: .inline)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
