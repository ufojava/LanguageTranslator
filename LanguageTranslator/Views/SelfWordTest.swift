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
    
  
    
    
    //Get shuffled list
    @State private var getCatListToggle = false
    
    
    
    var body: some View {

        
        VStack {
                
                
            
            
            
                    Button(action: {
                        
                        self.getCatListToggle.toggle()
                        
                        
                    }) {
                        
                        
                        Text("Shuffle")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(6)
                        
                        
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
            
                    
                    
                
            
                
            
            }//VStack Ending
            .navigationBarTitle(Text("Learning"))
        
        
        
    }
}


//Previews
struct WordTest_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WordTest()
    }
}



