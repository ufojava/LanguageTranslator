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
    //@State private var getCategorySearchToggle = false
    @State private var getWordSearchToggle = false
    
    
    //Number of Categories
    @State private var numberOfCategoris = 0
    
    //Total Words in Dictionary
    @State private var totalWordDictionay = 0
    
    //Number of Items in Categories
    
    func dictionaryStats(inCategory: String) -> Int {
        
        let categoryCount = dictionaryData.dictionaryData.filter {$0.Category == inCategory}.count
        
        
       return categoryCount
    }
    
    //Total Catergory dictionary counter
    var totalCategoryCount: Int {
        
        let catCounter = dictionaryData.dictionaryData.count
        
        return catCounter
        
        
    }
    
    //Stopped - Get Details
    func dictionaryDetail(inCat: String) -> some View {
        
        
        
        let dictionaryArray = dictionaryData.dictionaryData
         
         let filteredArray = dictionaryArray.filter {$0.Category == inCat}
         
         
         
        return  List(filteredArray,id: \.id) {data in
             Text("\(data.English) - ")
             Text("\(data.Urhobo)")
                 .foregroundColor(Color.blue)
            
            
        }
        
        
    }//End of dictionat details
    
    
    
    var body: some View {
        
        
          //NavigationView {
              
              VStack {
                Section(header: Text("----------------------------------").bold()) {
                    
                    HStack {
                   
                            //Category
                            NavigationLink(destination: FilteredDictionary()) {
                                
                                Text("Category")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(6)
                                
                            }//End of Category Search
                        
                            //Word Search
                        NavigationLink(destination: WordSearch()) {
                            
                            
                            Text("Word Search")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(6)
                        }
                       
               
                        
                    
                }//End of HStack
               
                    
                }//End of Section
                Spacer().frame(height:20)
                
                
                
                
                Section(header: Text("Category Breakdown").bold()) {
                List(categoryArray,id: \.self) {cat in
                    
                   
                    
                    HStack {
                        
                        Text("\(cat) - \(self.dictionaryStats(inCategory: cat))")
                        
                        Image(cat.lowercased())
                            .resizable()
                            .frame(width:50, height:50)
                            .scaledToFill()
                    
                  
                    }//End of HStack
                    
              
             
                }//End of List
                  
                }//End of Section
                
                Text(" Total Words: \(totalCategoryCount)")
                    .font(.system(.largeTitle))
                  
                  
              
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


