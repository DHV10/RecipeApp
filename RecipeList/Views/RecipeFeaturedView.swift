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
    var body: some View {
       
        VStack(alignment: .leading, spacing:0) {
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading )
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                //tab view for featured recipes
                TabView {
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
                                    }
                                    
                                }
                            })
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $isShow, content: {
                                RecipeDetailView(recipe : model.recipes[index])
                            })
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.6), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 10)
                            
                        }
                        
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
              
                
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            
            .padding([.leading, .bottom])
            
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
