//
//  RecipeCategoryView.swift
//  RecipeList
//
//  Created by DHV on 23/06/2021.
//

import SwiftUI

struct RecipeCategoryView: View {
    @EnvironmentObject var model: RecipeModel
    @Binding var selectedTab: Int
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("All Recipes")
                .bold()
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 35))
            
            GeometryReader { geo in
                
                ScrollView( showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
                        ForEach(Array(model.categories), id: \.self ){ cat in
                            
                            Button {
                                //
                                selectedTab = Constants.listTab
                                
                                model.selectedCategory = cat
                                
                            } label: {
                                VStack{
                                    Image(cat.lowercased())
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geo.size.width-20)/2, height: (geo.size.width-20)/2)
                                        .cornerRadius(10)
                                        .clipped()
                                    Text(cat)
                                        .foregroundColor(.black)
                                }
                            }
                            
                            
                        }
                    }
                }
                
                
            }
            .padding(.horizontal)
            
            
        }
        
    }
}
