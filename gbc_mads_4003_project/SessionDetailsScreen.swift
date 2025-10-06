//
//  SessionDetailsScreen.swift
//  gbc_mads_4003_project
//
//  Created by Jared on 6/10/2025.
//

import SwiftUI

struct SessionDetailsScreen: View {
    //TO DO :private variable swap out with session attributes later
    @State private var name : String = "name"
    @State private var id: Int = 0
    @State private var description: String = "descript"
    @State private var starRating: Int = 3// 0-5
    @State private var hostName: String = "host name"
    @State private var photos: [String] = ["https://imgs.search.brave.com/LEyQjRYoV4xKUaEbSsFzRTIxdcW_nFNtTbe2fZVOAjU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAxLzIwLzEyLzI2/LzM2MF9GXzEyMDEy/MjYxMF9TOXptb2lZ/RDdGWW5XNkRaZTBR/Smc0MW93OHdDNkpy/Ty5qcGc","star.circle.fill"]
    @State private var pricePerPerson: Int = 3
    @State private var phoneNumber: String = "+1"
    
    
    
    var body: some View {
        NavigationStack{
            VStack (alignment: .leading, spacing: 50) {
                
                
                //description
                Text("Description: \(description) ")
                    .padding(10)
                    .foregroundColor(.blue)
                
                
                //price per person
                Text("Price Per person: \(pricePerPerson) ")
                    .padding(10)
                    .foregroundColor(.blue)
                
                
                //star rating
                HStack{
                    ForEach(0..<5, id:\.self){index in
                        if(starRating <= index){
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
                    }.frame()
                   
                }
                
                
                //host name
                Text("Hosted by: \(hostName) ")
                    .padding(10)
                    .foregroundColor(.blue)
                
                
                
                //image/ photo display
                HStack {
                    ForEach(0..<photos.count, id:\.self){index in
                        Image(systemName: photos[index])
                            .imageScale(.large)
                            .font(.system(size: 40))
                            .foregroundColor(Color.gray)//TO DO: Delete when done
                            .background(Color.cyan)//TO DO: Delete when done
                    }.frame()
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
                    
                
                
                //Spacer() //fill up all the available room on screen with empty space
                
                    .navigationTitle("\(name) session")//app bar menu
                    .navigationBarTitleDisplayMode(.large)
            }//end of main V stack
        }//end of navigation stack
        .padding()
        .frame(minWidth: 100 ,maxWidth:.infinity, minHeight: 200, maxHeight: .infinity)
    }
}

#Preview {
    SessionDetailsScreen()
}
