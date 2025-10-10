//
//  FavoritesListScreen.swift
//  gbc_mads_4003_project
//
//  Created by Jared on 6/10/2025.
//

import SwiftUI



struct FavoritesListScreen: View {
    
    //TO DO replace this let variable with the correct carried over value. persistance
    let favoritesList : [Session]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        List(favoritesList) { sess in
            Text("name:\(sess.name)")
        }
        
        
        
        //delete all button
        Button(action: {
            self.deleteAllSessions()
    
        }, label: {
            Text("Delete all Sessions")
                .font(.subheadline)
        }
        )
        .padding()
        .buttonStyle(.borderedProminent)
        
    }//end of body
    
    func deleteAllSessions(){
        
    }
}


