//
//  RecipeHighlights.swift
//  RecipeList
//
//  Created by DHV on 08/06/2021.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    
    init(highlights: [String]) {
        //loop to all array of highlights
        for index in 0 ..< highlights.count  {
            //the last highlight doesnt have comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test1", "text2" ])
    }
}