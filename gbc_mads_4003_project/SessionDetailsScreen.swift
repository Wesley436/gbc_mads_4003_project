//
//  SessionDetailsScreen.swift
//  gbc_mads_4003_project
//
//  Created by Jared on 6/10/2025.
//

import SwiftUI

struct SessionDetailsScreen: View {
    let defaults = UserDefaults.standard
    let session: Session
    @State private var phoneNumber: String = "+1"
    
    @State private var addedToFavourite: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack (alignment: .leading, spacing: 50) {
                    //description
                    Text("Description: \(session.description) ")
                        .padding(10)
                        .foregroundColor(.blue)
                    
                    
                    //price per person
                    Text("Price Per person: \(session.pricePerPerson) ")
                        .padding(10)
                        .foregroundColor(.blue)
                    
                    
                    //star rating
                    HStack{
                        ForEach(0..<5, id:\.self){index in
                            if(session.starRating <= index){
                                Image(systemName: "star")
                                    .imageScale(.large)
                                    .font(.system(size: 40))
                                    .foregroundColor(Color.yellow)
                            } else {
                                Image(systemName: "star.fill")
                                    .imageScale(.large)
                                    .font(.system(size: 40))
                                    .foregroundColor(Color.yellow)
                            }
                        }
                       
                    }
                    
                    //host name
                    Text("Hosted by: \(session.hostName) ")
                        .padding(10)
                        .foregroundColor(.blue)
                    
                    
                    Button(action: {
                        if let phoneURL = URL(string: "tel://\(session.phoneNumber)"),
                           UIApplication.shared.canOpenURL(phoneURL) {
                            UIApplication.shared.open(phoneURL)
                        }
                    }) {
                        Text(session.phoneNumber)
                            .foregroundColor(.blue)
                    }
                   
                    
                    
                    //image/ photo display
                    ScrollView (.horizontal) {
                        HStack {
                            ForEach(0..<session.photos.count, id:\.self){index in
                                AsyncImage(url: URL(string: session.photos[index])){ result in
                                    result.image?
                                        .resizable()
                                        .scaledToFill()
                                        .cornerRadius(10)
                                        .clipped()
                                        .font(.system(size: 40))
                                }
                            }
                        }
                        .frame(maxHeight: 150)
                    }
                    
                    
                    HStack {
                        //favorites button
                        Button(action: {
                            if let savedUser = defaults.data(forKey: "currentUser"), let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser) {
                                let userId = decodedUser.id
                                
                                var userFavourites: [Int:[Int]] = [:]
                                if let savedUserFavourites = defaults.data(forKey: "userFavourites"), let decodedUserFavourites = try? JSONDecoder().decode([Int:[Int]].self, from: savedUserFavourites) {
                                    userFavourites = decodedUserFavourites
                                }
                                
                                var favouriteIds = userFavourites[userId] ?? []
                                if (!favouriteIds.contains(session.id)) {
                                    favouriteIds.append(session.id)
                                    userFavourites[userId] = favouriteIds
                                    if let encodedUserFavourites = try? JSONEncoder().encode(userFavourites) {
                                        defaults.set(encodedUserFavourites, forKey: "userFavourites")
                                    }
                                }
                                addedToFavourite = true
                            }
                        }) {
                            VStack {
                                Image(systemName: "heart")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)
                                
                                Text("Favorites button")
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }//end of VStack
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 70)
                            .background(.blue.opacity(0.6))
                            .cornerRadius(12)
                            .shadow(radius: 2)
                        }
                        .alert("Added to favourites", isPresented: $addedToFavourite) {
                            Button("OK", role: .cancel) { }
                        }
                        

                            ShareLink(item: "\(session.name), Price: \(session.pricePerPerson)") {
                                VStack {
                                    Image(systemName: "square.and.arrow.up")
                                        .foregroundColor(.white)
                                        .padding(.bottom, 5)
                                    Text("Share Session")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 70)
                            .background(.blue.opacity(0.6))
                            .cornerRadius(12)
                            .shadow(radius: 2)
                        //}end of button
                    }
        
                    Spacer()
                }
                .navigationTitle("\(session.name)")//app bar menu
                .navigationBarTitleDisplayMode(.large)//end of main V stack
            }
            
        }//end of navigation stack
    }
}
