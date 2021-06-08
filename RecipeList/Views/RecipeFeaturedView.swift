//
//  RecipeFeaturedView.swift
//  RecipeList
//
//  Created by DHV on 06/06/2021.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var isShow = false
    @State var selectedTabIndex = 0
    var body: some View {
       
        VStack(alignment: .leading, spacing:0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading )
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 35))
            
            GeometryReader { geo in
                //tab view for featured recipes
                TabView(selection: $selectedTabIndex) {
                    //loop to recipes
                    ForEach(0..<model.recipes.count) { index in
                        //loop only to recipes í featured
                        if model.recipes[index].featured {
                            
                            Button(action: {
                                self.isShow = true
                            }, label : {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
        //                                    .scaledToFit()
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                            .font(Font.custom("Avenir", size: 15))
                                    }
                                    
                                }
                            })
                            .tag(index)
                            
                            .sheet(isPresented: $isShow, content: {
                                RecipeDetailView(recipe : model.recipes[index])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.6), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 10)
                            
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
              
                
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(.headline)
                Text(model.recipes[selectedTabIndex].prepTime)
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[selectedTabIndex].highlights)
            }
            
            .padding([.leading, .bottom])
            
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex() {
        //find the index of first recipe that is featured
        let index = model.recipes.firstIndex { (recipe ) -> Bool in
            return recipe.featured
        }
        
        selectedTabIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
