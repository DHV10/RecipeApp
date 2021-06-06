//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by DHV on 03/06/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    
                //MARK: diagnior
                VStack(alignment: .leading) {
                    Text("ingredients")
                        .font(.headline)
                        .padding([.bottom,.trailing], 5)
                    ForEach(recipe.ingredients, id: \.self) { item in
                        Text("• "+item)
                    }
                }
                .padding(.horizontal)
                Divider()
                //MARK: direction
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .trailing], 5)
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
                
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[1])
    }
}
