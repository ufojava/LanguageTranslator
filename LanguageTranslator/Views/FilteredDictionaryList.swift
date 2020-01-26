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
    
    //Variable for Picker
    var selectCategory = ["Annatomy","Currency","Fruits","Numeracy","Phrases","Profession","Relationship","Religion"]
    @State private var selectedCategory = 0
    
    
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
        
            Form {
                
                Section(header: Text("Select Category").bold()) {
            
            
                    Picker(selection: $selectedCategory, label: Text("Select Category")) {
                        
                        ForEach(0..<8) {
                            
                            Text(self.selectCategory[$0])
                        }//End Foreach
                        
                    }//End Picker
            
                }//End of Section
    
        
                
            Button(action: {
                
                self.showDetails.toggle()
                
                
                
            }) {
                
                Text("Get Details")
                .padding()
                    .frame(width:120, height: 35)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(6.0)
                    
                
                
            }//End of the Button Execute closure
            
            if showDetails {
                
                self.filteredArray(inEnglishWord: selectCategory[selectedCategory])
                
            }//End of Button
                
             
                
        
            
            }//End of Form
            
            
            Spacer()
            
        }//End VStack
            
        
            .navigationBarTitle(Text("Category"),displayMode: .inline)
    }
    
}



//Preview filtered struct
struct FilteredDictionary_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FilteredDictionary()
        
    }
    
}
