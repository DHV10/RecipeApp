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
    @State private var isShowingSettings: Bool = false
    
    private var title: String {
        if model.selectedCategory == nil || model.selectedCategory == Constants.defaultList {
            return "All Recipes"
        }
        else {
            return model.selectedCategory!
        }
        
    }
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text(title)
                    .bold()
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 35))
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes){ r in
                            
                            if model.selectedCategory == nil || model.selectedCategory == Constants.defaultList || model.selectedCategory != nil && r.category == model.selectedCategory {
                                
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
            }
            //            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationBarItems(
                trailing:
                    Button(action: {
                        isShowingSettings = true
                    }) {
                        Image(systemName: "person")
                    }
                    .sheet(isPresented : $isShowingSettings) {
                        SettingsView()
                    }
            )
            
            .padding(.leading)
            .padding(.top)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            //            .navigationBarHidden(true)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
