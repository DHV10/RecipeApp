//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by DHV on 03/06/2021.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: recipe image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    
                //MARK: name
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .bold()
                        .padding(.top, 20)
                        .padding(.leading)
                        .font(Font.custom("Avenir Heavy", size: 35))                }
                
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir ", size: 15))  
                    Picker("", selection: $selectedServingSize ) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.font(Font.custom("Avenir ", size: 15))
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                }
                .padding()
                
                //MARK: diagnior
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 18))
                        .padding([.bottom,.trailing], 5)
                    ForEach(recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServing: recipe.servings, targetServing: selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir ", size: 15))
                    }
                }
                .padding(.horizontal)
                Divider()
                //MARK: direction
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 18))
                        .padding([.bottom, .trailing], 5)
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir ", size: 15))
                    }
                }
                .padding(.horizontal)
                
            }
        }
//        .navigationBarTitle(recipe.name)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[1])
    }
}
