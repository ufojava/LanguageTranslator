//
//  ContentView.swift
//  LanguageTranslator
//
//  Created by Ufuoma Okoro on 23/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
   //Get the decoded data
    @ObservedObject var dictionaryData = DataLoader()
    
    
    var body: some View {
        
        NavigationView {
        
        VStack {
            
            //List the Data in a View
            
            
            
            List(dictionaryData.dictionaryData, id: \.id) { data in
            
                
                VStack {
                Text("\(data.Category) - ")
                    .foregroundColor(Color.red)
                }
                HStack {
                    
                Text("\(data.English) - ")
                    .foregroundColor(Color.blue)
                Text("\(data.Urhobo)")
                }
            }
                
            .font(.system(size: 14))
        .navigationBarTitle(Text("Urhobo Translator"))
        }
         
    }
    }
        
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
