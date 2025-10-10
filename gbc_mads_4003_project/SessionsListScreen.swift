//
//  SessionsListScreen.swift
//  gbc_mads_4003_project
//
//  Created by Jared on 6/10/2025.
//

import SwiftUI

struct SessionsListScreen: View {
   
    
    var body: some View {
        
        NavigationView {
                    List {
                        ForEach(SessionsManager.sessions) { session in
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
                        }
                    }
                    .navigationTitle("Nature Walk Sessions")
                }
            }
        }
        
