//
//  User.swift
//  gbc_mads_4003_project
//
//  Created by user on 2025-10-03.
//

import Foundation

class User: Codable {
    var id: Int
    var email: String
    var password: String
    
    init (id: Int, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }
}
