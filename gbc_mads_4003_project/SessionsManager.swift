//
//  SessionsManager.swift
//  gbc_mads_4003_project
//
//  Created by user on 2025-10-03.
//

import Foundation

class SessionsManager {
    static var sessions: [Session] = [
        Session(id: 1, name: "Session A", description: "Description A", starRating: 5, hostName: "Host A", photos: ["URL 1", "URL 2"], pricePerPerson: 10, phoneNumber: "1234567890"),
        Session(id: 2, name: "Session B", description: "Description B", starRating: 3, hostName: "Host B", photos: ["URL 3", "URL 4"], pricePerPerson: 20, phoneNumber: "2234567890"),
        Session(id: 3, name: "Session C", description: "Description C", starRating: 1, hostName: "Host C", photos: ["URL 5", "URL 6"], pricePerPerson: 30, phoneNumber: "3234567890")
    ]
    
    // useful for getting a user's favourite sessions
    class func findSessionsByIds(ids: [Int]) -> [Session] {
        var sessionsFound: [Session] = []
        for session in sessions {
            if (ids.contains(session.id)) {
                sessionsFound.append(session)
            }
        }
        
        return sessionsFound
    }
}
