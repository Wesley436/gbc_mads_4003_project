//
//  Session.swift
//  gbc_mads_4003_project
//
//  Created by user on 2025-10-03.
//

import Foundation

class Session: Identifiable , ObservableObject{
    var id: Int
    var name: String   //name of session
    var description: String
    var starRating: Int
    var hostName: String //Name of the guide or organization hosting the session
    var photos: [String]
    var pricePerPerson: Int
    var phoneNumber: String
    @Published var isFavorite: Bool
    
    init (id: Int, name: String, description: String, starRating: Int, hostName: String, photos: [String], pricePerPerson: Int, phoneNumber: String , isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.description = description
        self.starRating = starRating
        self.hostName = hostName
        self.photos = photos
        self.pricePerPerson = pricePerPerson
        self.phoneNumber = phoneNumber
        self.isFavorite = isFavorite
        
    }
}
