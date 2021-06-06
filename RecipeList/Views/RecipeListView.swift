//
//  ContentView.swift
//  RecipeList
//
//  Created by DHV on 03/06/2021.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject  var model = RecipeModel()
    
    var body: some View {
       
        NavigationView {
           
            List(model.recipes){ r in
                
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
                            Text(r.name)
                        }

                    })
                
                
                
            }
            .navigationBarTitle("Food", displayMode: .large)
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
