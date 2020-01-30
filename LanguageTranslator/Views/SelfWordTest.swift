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
    @State private var urhoboWord = ""
 
    
  
    
    
    //Get shuffled list
    @State private var getCatListToggle = false
    @State private var getTestWordToggle = false
    
    
    
    var body: some View {

        
        VStack {
                
                
            
            Form {
            
                
                Section(header: Text("Get new word").bold()) {
            
                    Button(action: {
                        
                       
                        
                        self.getCatListToggle.toggle()
                       
                    }) {
                        
                        
                        Text("  Shuffle  ")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(6)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        
                        
                        }
                    
                Spacer()
                    
            
         
                    if getCatListToggle {
                    List(dictionaryData.dictionaryData.shuffled().prefix(upTo: 1),id: \.id) { data in
                       
                        VStack(alignment: .leading) {
                        Text("English:  \(data.English)")
                            .foregroundColor(Color.red)
                        Text("Urhobo:   \(data.Urhobo.trimmingCharacters(in: .decomposables))")
                            .foregroundColor(Color.blue)
                        
                        }//.padding()
                        Spacer().frame(height:10)
                    }//End of List
                       
                    
                    }//End if If Statement
            
                    
                }//End of Section
                
                
                Section(header: Text("Click Hide Word and Now try youself").bold()) {
                    
                    
                    Button(action: {
                        
                        self.getCatListToggle.toggle()
                        self.getTestWordToggle.toggle()
                        
                        
                    }) {
                        
                        
                        Text("Hide Word")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                        .cornerRadius(6)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,  maxHeight: .infinity, alignment: .center)
                        
                        
                    }
                    
                   
                    
                    TextField("Urhobo Word",text: $urhoboWord)
                    
                    
                    
                    Spacer()
                    
                    List(dictionaryData.dictionaryData.filter {$0.Urhobo.contains(self.urhoboWord) || $0.Urhobo.contains(self.urhoboWord.lowercased()) },id: \.id) { word in
                        
                        Text("\(word.English)")
            
                            .foregroundColor(Color.blue)
                        
                    }//List End
                    .id(UUID())
                    
                    
                }
                
            }//End of form
            
            
            }//VStack Ending
            .navigationBarTitle(Text("Learning 📕"))
        
        
        
    }
}


//Previews
struct WordTest_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WordTest()
    }
}



