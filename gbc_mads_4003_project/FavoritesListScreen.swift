//
//  FavoritesListScreen.swift
//  gbc_mads_4003_project
//
//  Created by Jared on 6/10/2025.
//

import SwiftUI



struct FavoritesListScreen: View {
    @State private var favoriteSessions : [Session] = []
    @State private var userId: Int = -1
    @State private var userFavourites: [Int:[Int]] = [:]
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favoriteSessions) { session in
                        NavigationLink(destination: SessionDetailsScreen(session: session)) {
                            HStack(spacing: 15) {
                                AsyncImage(url: URL(string: session.photos.first!)){ result in
                                    result.image?
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(10)
                                        .clipped()
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(session.name)
                                        .font(.headline)
                                    
                                    Text("$\(session.pricePerPerson) per person")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                        
                        Button(action: {
                            if let index = userFavourites[userId]!.firstIndex(of: session.id) {
                                userFavourites[userId]!.remove(at: index)
                            }
                            
                            if let index = favoriteSessions.firstIndex(where: { $0.id == session.id }) {
                                favoriteSessions.remove(at: index)
                            }
                            if let encodedUserFavourites = try? JSONEncoder().encode(userFavourites) {
                                defaults.set(encodedUserFavourites, forKey: "userFavourites")
                            }
                            
                        }, label: {
                            Text("Remove favourite")
                            }
                        )
                }
            }
            .navigationTitle("Favourite Sessions")
        }
        .onAppear() {
            if let savedUser = defaults.data(forKey: "currentUser"), let decodedUser = try? JSONDecoder().decode(User.self, from: savedUser) {
                userId = decodedUser.id
                if let savedUserFavourites = defaults.data(forKey: "userFavourites"), let decodedUserFavourites = try? JSONDecoder().decode([Int:[Int]].self, from: savedUserFavourites) {
                    userFavourites = decodedUserFavourites
                    let favouriteIds = userFavourites[userId] ?? []
                    favoriteSessions = SessionsManager.findSessionsByIds(ids: favouriteIds)
                }
            }
        }
        
        //delete all button
        Button(action: {
            userFavourites[userId] = []
            if let encodedUserFavourites = try? JSONEncoder().encode(userFavourites) {
                defaults.set(encodedUserFavourites, forKey: "userFavourites")
            }
            
            favoriteSessions = []
        }, label: {
            Text("Delete all Sessions")
                .font(.subheadline)
            }
        )
        .padding()
        .buttonStyle(.borderedProminent)
    }//end of body
}


