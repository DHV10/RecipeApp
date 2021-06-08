//
//  ContentView.swift
//  RecipeList
//
//  Created by DHV on 03/06/2021.
//

import SwiftUI

struct RecipeListView: View {
    
    //    @ObservedObject  var model = RecipeModel()
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 35))
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes){ r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    HStack {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .clipped()
                                            .cornerRadius(8)
                                        VStack(alignment: .leading) {
                                            Text(r.name)
                                                .bold()
                                                .font(Font.custom("Avenir Heavy", size: 18))
                                                .foregroundColor(.black)
                                            RecipeHighlights(highlights: r.highlights)
                                                .font(Font.custom("Avenir ", size: 15))
                                                .foregroundColor(.black)
                                        }
                                    }
                                
                                })
                        }
                    }

                }
            }
//            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .padding(.leading)
            .navigationBarHidden(true)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
