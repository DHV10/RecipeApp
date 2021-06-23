//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by DHV on 06/06/2021.
//

import SwiftUI

struct RecipeTabView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var selectedTab = Constants.featuredTab
    
    var body: some View {
        TabView(selection: $selectedTab) {
           RecipeFeaturedView()
                .tabItem {
                    VStack {
                     
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            .tag(Constants.featuredTab)
            
            RecipeCategoryView(selectedTab: $selectedTab)
                 .tabItem {
                     VStack {
                      
                         Image(systemName: "square.grid.2x2")
                         Text("Category")
                     }
                 }
                .tag(Constants.categoryTab)
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
                .tag(Constants.listTab)
        }
//        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()	
    }
}
