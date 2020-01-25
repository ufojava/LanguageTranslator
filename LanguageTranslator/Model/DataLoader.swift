//
//  DataLoader.swift
//  LanguageTranslator
//
//  Created by Ufuoma Okoro on 24/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import Foundation


public class DataLoader: ObservableObject {
    
    @Published var dictionaryData = [Dictionary]() //Get the construct from Data Structure file
    
    
    //Initialize load function
    
    init() {
        
        //Load function -This will ensure the data has loaded first
        load()
        
        //Now sort the data with the function
        sort()
        
    }
    
    
    //Create function to load file
    
    func load() {
        
        
        
        //Get the file - use If let to prevent a crash if the file is not avaiable
        if let fileLocation = Bundle.main.url(forResource: "DictionaryData", withExtension: "json") {
            
            //Need to add a Do / Catch to handle the error
            
            do {
                
                //Need to get the data - using Data(ContentOf URL
                let data = try Data(contentsOf: fileLocation)
                
                //We now need to decode it and map to our Data Structure
                let jsonDecoder = JSONDecoder()
                
                //Now need to decode the Data
                let dataFromJson = try jsonDecoder.decode([Dictionary].self, from: data)
                
                
                DispatchQueue.main.async {
                    
                    //Now set the data from Json to the published Array
                    self.dictionaryData = dataFromJson
                    
                }
                
                
                
            } catch {
                
                print(error)
                
            }
            
            
        }
        
    
    }
    
    //I would like to sort the data
    func sort() {
        
        //Would like to sort by category
        self.dictionaryData = self.dictionaryData.sorted(by: { $0.Category == $1.Category})
        
    }
    
    
}
