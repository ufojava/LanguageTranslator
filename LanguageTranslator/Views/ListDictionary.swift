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
    
    //Category Array
    @State private var categoryArray = ["Anatomy","Currency","Fruits","Numeracy","Phrases","Profession","Relationship","Religion"]
    
    //Variables to link to Word & Category Search
    @State private var getCategorySearch = false
    @State private var getWordSearch = false
    
    
    //Number of Categories
    @State private var numberOfCategoris = 0
    
    //Number of Items in Categories
    
    func dictionaryStats(inCategory: String) -> Int {
        
        let categoryCount = dictionaryData.dictionaryData.filter {$0.Category == inCategory}.count
        
       return categoryCount
    }
    
    
    
    var body: some View {
        
        
          //NavigationView {
              
              VStack {
                  
                
              
                      
                List(categoryArray,id: \.self) {cat in
                    
                   
                    
                    HStack {
                        
                        Text("\(cat) - \(self.dictionaryStats(inCategory: cat))")
                        
                        Image(cat.lowercased())
                            .resizable()
                            .frame(width:50, height:50)
                            .scaledToFill()
                    
                  
                    }
             
                }
                  
                  
                  
                  
              
              }//End of VStack
            
                .navigationBarTitle(Text("Categories"),displayMode: .inline)
               
          //}//End of Navigation View
        
    }
}


struct ListDictionary_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ListDictionary()
        
    }
}


