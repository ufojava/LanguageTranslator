//
//  FilteredWordSearch.swift
//  LanguageTranslator
//
//  Created by Ufuoma Okoro on 26/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//Stuct to filter Dictionay to allow for specific search
import SwiftUI



struct WordSearch: View {
    
    //Get Dataloader decoded environment
    @ObservedObject var dictionaryData = DataLoader()
    
    @State private var englishWord = ""
    
    
    var body: some View {
        
        //NavigationView {
    
        VStack {
            
            Form {
                
                Section(header: Text("Enter English Word").bold()) {
                
        
                    TextField("Enter Word",text: $englishWord)
                    
                    List(dictionaryData.dictionaryData.filter {$0.English.contains(self.englishWord)},id: \.id) { word in
                        
                        Text("\(word.English) - ")
                        Text("Means: \(word.Urhobo)")
                            .foregroundColor(Color.blue)
                        
                    }//List End
                
                }//Section End
            
            
            }//Form Ending
            
            .navigationBarTitle(Text("Word Search"),displayMode: .inline)
            
        }//End of VStack
            
        //}//Navigation View for Testing
        
    }//Body View Ending
    
}//Struct View



//WordSearch Preview
struct wordSearch_Preview: PreviewProvider {
    
    static var previews: some View {
        
        WordSearch()
        
    }
}
