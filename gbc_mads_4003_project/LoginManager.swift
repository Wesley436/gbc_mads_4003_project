//
//  LoginManager.swift
//  gbc_mads_4003_project
//
//  Created by user on 2025-10-03.
//

import Foundation

class LoginManager {
    static var users: [User] = [
        User(id: 1, email: "test@gmail.com", password: "test123"),
        User(id: 2, email: "admin@gmail.com", password: "admin123")
    ]
    
    class func login(email: String, password: String) -> User? {
        for user in users {
            if (user.email == email && user.password == password) {
                return user
            }
        }
        
        return nil
    }
}
