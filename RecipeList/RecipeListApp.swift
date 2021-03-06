//
//  RecipeListApp.swift
//  RecipeList
//
//  Created by DHV on 03/06/2021.
//

import SwiftUI

@main
struct RecipeListApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
    }
}
