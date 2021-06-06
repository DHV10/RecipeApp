//
//  DataService.swift
//  RecipeList
//
//  Created by DHV on 03/06/2021.
//

import Foundation

class DataSevice {
    
   static func getLocalData() -> [Recipe] {
        
        //Parse local json file
        //get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else {
            return [Recipe]()
        }
   
        
    
        //create a url object
        let url = URL(fileURLWithPath: pathString!)
        //create a data object
        do{
            let data = try Data(contentsOf: url)
            //decode the data with a JSON decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                return recipeData
            }catch {
                print(error)
            }
            //add unique IDs
            
            //return the recipes
            
        }
        catch {
            print(error)
        }
        
        
        
        return [Recipe]()
        
    }
    
}
