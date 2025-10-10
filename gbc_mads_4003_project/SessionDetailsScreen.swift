//
//  SessionDetailsScreen.swift
//  gbc_mads_4003_project
//
//  Created by Jared on 6/10/2025.
//

import SwiftUI

struct SessionDetailsScreen: View {
    
     let session: Session
    @State private var phoneNumber: String = "+1"
    
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
                    
                    
                    HStack {
                        //TO DO: delete the words button when done functionality
                        //favorites button
                        //Button(action: action) {
                            VStack {
                                Image(systemName: "heart")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)
                                
                                Text("favorites button")
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }//end of VStack
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 70)
                            .background(.blue.opacity(0.6))
                            .cornerRadius(12)
                            .shadow(radius: 2)
                        //}end of button
                        
                        //Share button
                       // TO DO: make the action go to pages
                        //Button(action: action) {
                            VStack {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.white)
                                    .padding(.bottom, 5)
                                
                                Text("Share button")
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }//end of VStack
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
