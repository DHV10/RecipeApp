//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by DHV on 06/06/2021.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            Text("Featured")
                .tabItem {
                    VStack {
                     
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
