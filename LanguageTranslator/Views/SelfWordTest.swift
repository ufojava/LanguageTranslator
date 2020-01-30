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
                    
                    if getCatListToggle {
                    List(dictionaryData.dictionaryData.shuffled().prefix(upTo: 3),id: \.id) { data in
                       
                        Text("\(data.English)")
                        
                    }
                    
                    }
            
                
                //Spacer()
            

            }//VStack Ending
            
        
        
        
    }
}


//Previews
struct WordTest_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WordTest()
    }
}



