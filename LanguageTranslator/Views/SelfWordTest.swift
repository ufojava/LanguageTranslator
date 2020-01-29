//
//  SelfWordTest.swift
//  LanguageTranslator
//
//  Created by Ufuoma Okoro on 28/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//The file prepares user for a word test
import SwiftUI

struct WordTest: View {

    //Get Data
    @ObservedObject var dictionaryData = DataLoader()
    
    var categoryArray = ["Anatomy","Currency","Fruits","Numeracy","Phrases","Profession","Relationship","Religion"]
    
    @State private var selectedCategory = 0
    
    //Declare selection difficulty
    @State private var selectionDifficulty = ""
    
    func processDifficulty(inCatSelection: String) -> String {
        
        var difficulty = ""
        
        switch inCatSelection {
            
        case "Anatomy":
            difficulty = "Easy"
            
        case "Currency":
            difficulty = "Medium"
            
        case "Fruits":
            difficulty = "Easy"
            
        case "Numeracy":
            difficulty = "Medium"
            
        case "Phrases":
            difficulty = "Difficult"
            
        case "Profession":
            difficulty = "Medium"
        
        case "Relationship":
            difficulty = "Medium"
        
        case "Religion":
            difficulty = "Medium"
            
        default:
            difficulty = "Easy"
            
        }
        
        return difficulty
        
    }
    
    
    
    
    var body: some View {
        
        NavigationView {
        
        VStack {
            
            Form {
                
                Section(header: Text("Selection").bold()) {
                
                Picker(selection: $selectedCategory, label: Text("Select Category")) {
                    
                    ForEach(0..<8) {
                        
                        Text(self.categoryArray[$0])
                        
                    }
                    
                    
                    
                }//Picker End
            
                    
                }//Section End
                
                
                Section(header: Text("Selection Difficulty").bold()) {
                    
                    Text("\(processDifficulty(inCatSelection: categoryArray[selectedCategory]))")
                    
                    
                    
                    
                }
                
                
            }

            }
        }
        
        
        
        
        
        
        
        
    }
}


//Previews
struct WordTest_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WordTest()
    }
}



