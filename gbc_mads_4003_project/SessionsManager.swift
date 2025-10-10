//
//  SessionsManager.swift
//  gbc_mads_4003_project
//
//  Created by user on 2025-10-03.
//

import Foundation

class SessionsManager {
    static var sessions: [Session] = [
        Session(id: 1, name: "Session A", description: "Description A", starRating: 5, hostName: "Host A", photos: ["https://natureconservancy-h.assetsadobe.com/is/image/content/dam/tnc/nature/en/photos/w/o/WOPA160517_D056-resized.jpg?crop=864%2C0%2C1728%2C2304&wid=600&hei=800&scl=2.88", "https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-fall-nature-scenery-free-image.jpeg?w=600&quality=80"], pricePerPerson: 10, phoneNumber: "1234567890"),
        Session(id: 2, name: "Session B", description: "Description B", starRating: 3, hostName: "Host B", photos: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgC3hQo68WRhh6Acdn97Pxj5M4TGTqL2nU5Q&s", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlZ2vhLzIdtwpwXw90ZuWhngB-MdFsjD64CQ&s"], pricePerPerson: 20, phoneNumber: "2234567890"),
        Session(id: 3, name: "Session C", description: "Description C", starRating: 1, hostName: "Host C", photos: ["https://greggvanourek.com/wp-content/uploads/2023/08/Nature-path-by-water-trees-and-mountains-AdobeStock_291242770-scaled.jpeg", "https://natureconservancy-h.assetsadobe.com/is/image/content/dam/tnc/nature/en/photos/z/u/Zugpsitze_mountain.jpg?crop=0%2C176%2C3008%2C1654&wid=1300&hei=715&scl=2.313846153846154"], pricePerPerson: 30, phoneNumber: "3234567890")
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
