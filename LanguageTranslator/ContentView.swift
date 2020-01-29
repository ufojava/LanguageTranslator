//
//  ContentView.swift
//  LanguageTranslator
//
//  Created by Ufuoma Okoro on 23/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
 
    var body: some View {
        
        NavigationView {
        
            VStack {
                    
                    ZStack(alignment: .bottom) {
                        
                    
                            
                        //Insert Applcation Background
                        Image("UrhoboBkGrd_Green")
                        .resizable()
                        .scaledToFill()
                            
                        
                        //Call Menu
                        Menu()
                        
                    }.padding() //End of ZStack
                    
                    
                }//End of VStack
            
            .navigationBarTitle(Text("Language🗣"))
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


    
    
