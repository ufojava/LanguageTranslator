//
//  ListDictionary.swift
//  LanguageTranslator
//
//  Created by Ufuoma Okoro on 25/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import SwiftUI



struct ListDictionary: View {
    
    @ObservedObject var dictionaryData = DataLoader()
    
    var body: some View {
        
        
          NavigationView {
              
              VStack {
                  

                  
                  
                  List {
                      
                      
                      ForEach(dictionaryData.dictionaryData, id: \.id) { data in
                          
                          
                          
                        Section(header: Text("Category: \(data.Category)").font(.headline)) {
                              
                                  
                                  Text("English: \(data.English)")
                                      .foregroundColor(Color.blue)
                                  Text("Urhobo: \(data.Urhobo)")
                                      .foregroundColor(Color.purple)
                                  
                           
                              
                          }//End of Section
                          
                          
                          
                          
                      }//End of ForEach
                      
                      
                      
                      
                  }//End of List
                  
                  
                  
                  
                  
              
              }//End of VStack
            
            .navigationBarTitle(Text("Urhobo Translator"))
               
          }//End of Navigation View
        
    }
}


struct ListDictionary_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ListDictionary()
        
    }
}
