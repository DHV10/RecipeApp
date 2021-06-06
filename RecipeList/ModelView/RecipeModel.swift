//
//  RecipeModel.swift
//  RecipeList
//
//  Created by DHV on 03/06/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        //get data from data sevices
        self.recipes = DataSevice.getLocalData()
        
    }
}
