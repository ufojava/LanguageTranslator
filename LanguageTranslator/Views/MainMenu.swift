//
//  MainMenu.swift
//  LanguageTranslator
//
//  Created by Ufuoma Okoro on 25/01/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

//File to hold the menu system
import SwiftUI


struct Menu: View {
    
    @State private var showFrontImage = true
    @State private var showAllDictionary = false
    @State private var showSearch = false
    
    
    
    
    var body: some View {
        
        
        
        VStack {
            
            
            
            //VStack for Icons
            
            VStack {
                
                
                if showFrontImage {
                    Image("front_image")
                        .resizable()
                        .scaledToFill()
                        .frame(width:150, height: 50)
                        .transition(.scale)
                    
                        
                }
            
            //Menu Icon for All Records
            if showAllDictionary {
                
                HStack {
                        MenuIcons(icon: "folder")
                            .foregroundColor(Color.yellow)
                        
                        //Icon Legend
                        Text("Translator")
                            .foregroundColor(Color.black)
                            .fontWeight(.bold)
                    
                }
                
            }//End show All Dictionary
            
            
            //Show Custom Search
            if showSearch {
                
                HStack {
                    
                    MenuIcons(icon: "magnifyingglass")
                        .foregroundColor(Color.purple)
                    
                    
                    //Icon Legend
                    Text("Search")
                        .foregroundColor(Color.black)
                        .fontWeight(.bold)
                    
                }
                
            }
            
            }//End of VStack for Icons
            Spacer().frame(height:230)
            
            Button(action: {
                
                self.showSubMenu()
                
            }) {
                
                
                
                
                //Main Menu Icon
                Text("Menu")
                    .foregroundColor(Color.black).fontWeight(.bold)
                Image(systemName: "list.number")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.black)
                
            }
            
                    
                    
                }//End of VStack
        
        
        
    }
    
    //Function to toggle Icons and Images
    func showSubMenu() {
        
        
        //Front Image
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            
            withAnimation {
                self.showFrontImage.toggle()
                
            }
        }
        
        //All Dictionary
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            withAnimation {
                
                self.showAllDictionary.toggle()
            }
        }
        
        
        //Custom Search
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            withAnimation {
                
                self.showSearch.toggle()
            }
        }
        
    }
}


//Struct PreViews
struct Menu_Previews:   PreviewProvider {
    
    static var previews: some View {
        
        Menu()
    }
}


//Struct for Icons
struct MenuIcons: View {
    
    var icon: String
    
    //Icon Template
    var body: some View {
        
        VStack {
        
    
            Image(systemName: icon)
                .resizable()
                .frame(width:35, height: 35)
                .shadow(color: .black, radius: 0.3, x: 1, y: 1)
        
            
        }//End of VStack
        
    }//End of Body View
    
}//End os Struct










