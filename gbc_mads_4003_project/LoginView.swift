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
    
    let defaults = UserDefaults.standard
    
    var body: some View {
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
                        if (rememberMe) {
                            if let encodedUser = try? JSONEncoder().encode(user) {
                                defaults.set(encodedUser, forKey: "user")
                            }
                        } else {
                            defaults.removeObject(forKey: "user")
                        }
                        defaults.set(rememberMe, forKey: "rememberMe")
                        
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
            if let savedUser = defaults.data(forKey: "user"), let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser) {
                email = decodedUser.email
                password = decodedUser.password
            }
            
            rememberMe = UserDefaults.standard.bool(forKey: "rememberMe")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
