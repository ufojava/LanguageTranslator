//
//  FilteredDictionaryList.swift
//  LanguageTranslator
//
//  Created by Ufuoma Okoro on 25/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//This files will show a filtered list based on category
import SwiftUI


struct FilteredDictionary: View {
    
    //Get the published Dictionary
    @ObservedObject var dictionaryData = DataLoader()
    
    //Input from User
    @State private var wordCategory = ""
    @State var showDetails = false
    
    
    func filteredArray(inEnglishWord: String) -> some View {
        
        let ourArray = dictionaryData.dictionaryData
        
        let filteredArray = ourArray.filter {$0.Category == inEnglishWord}
        
       return  List(filteredArray,id: \.id) {data in
            Text("\(data.English) - ")
            Text("\(data.Urhobo)")
                .foregroundColor(Color.blue)
            
        }
       
    }//End of Function
    
    
    var body: some View {
        
        VStack {
        
            
            TextField("Enter Category",text: $wordCategory)
                .font(.system(size:20))
                .padding()
                .border(Color.gray,width: 0.6)
                .cornerRadius(2)
                
                
                .padding()
            
            //Spacer()
  
            Button(action: {
                
                self.showDetails.toggle()
                
                
                
            }) {
                
                Text("Get Details")
                
                
            }//End of the Button Execute closure
            
            if showDetails {
                
                self.filteredArray(inEnglishWord: self.wordCategory)
                
            }//Code to follow button action
            
            
            
            
            Spacer()
            
        }//End VStack
            
        
            .navigationBarTitle(Text("Category \(self.wordCategory)"),displayMode: .inline)
    }
    
}



//Preview filtered struct
struct FilteredDictionary_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FilteredDictionary()
        
    }
    
}
