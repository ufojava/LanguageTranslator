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
    
    
    //Stopped - Get Details
    func dictionaryDetail(inCat: String) -> some View {
        
        
        let dictionaryArray = dictionaryData.dictionaryData
         
         let filteredArray = dictionaryArray.filter {$0.Category == inCat}
         
         
         
        return  List(filteredArray,id: \.id) {data in
             Text("\(data.English) - ")
             Text("\(data.Urhobo)")
                 .foregroundColor(Color.blue)
            
            
        }
        
        
    }
    
    
    
    var body: some View {
        
        
          //NavigationView {
              
              VStack {
                Section(header: Text("Search").bold()) {
                    VStack {
                    
                    Button(action: {}) {
                        
                        Text("Category")
                        .padding()
                            .frame(width:250,  height: 30)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(6)
                        
                        
                    }.padding(.horizontal, 50)
                        
                        Spacer().frame(height:10)
                    
                    Button(action: {}) {
                        
                        Text("Word Search")
                        .padding()
                        .frame(width:250,  height: 30)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(6)
                    }.padding(.horizontal, 50)
                        
                    
                }//End of HStack
               
                }//End of Section
                Spacer().frame(height:10)
                Section(header: Text("Category Statistics").bold()) {
                List(categoryArray,id: \.self) {cat in
                    
                   
                    
                    HStack {
                        
                        Text("\(cat) - \(self.dictionaryStats(inCategory: cat))")
                        
                        Image(cat.lowercased())
                            .resizable()
                            .frame(width:50, height:50)
                            .scaledToFill()
                    
                  
                    }//End of HStack
                    
              
             
                }//End of List
                  
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


