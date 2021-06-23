//
//  RecipeModel.swift
//  RecipeList
//
//  Created by DHV on 03/06/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    @Published var categories = Set<String>()
    @Published var selectedCategory: String?
    
    init() {
        //get data from data sevices
        self.recipes = DataSevice.getLocalData()
        //get categories to a Set
        self.categories = Set(self.recipes.map { r in
            return r.category
        })
        //add "all recipes"
        self.categories.update(with: Constants.defaultList)
        
    }
    
   static func getPortion(ingredient: Ingredients, recipeServing: Int , targetServing: Int) -> String {
    
    //result
    var portion = ""
   //tử số
    var numerator = ingredient.num ?? 1
    //mẫu số
    var denominator = ingredient.denom ?? 1
    //phần nguyên
    var wholePortion = 0
    //check khác nil
    if ingredient.num != nil {
        // nhân tử số với recipe serving
        denominator *= recipeServing
        //nhân mẫu số với target serving
        numerator *= targetServing
        //rút gọn tử và mẫu số
        let divisor = Rational.greatestCommonDivisor(numerator, denominator)
        numerator /= divisor
        denominator /= divisor
        //check tử số lớn hơn hoặc bằng mẫu số
        if numerator >= denominator {
            //chia tử số cho mẫu số lấy phần nguyên
            wholePortion = numerator / denominator
            //chia tử số cho mẫu số lấy phần dư
            numerator = numerator % denominator
            //thêm phần nguyên vào chuỗi kết quả
            portion += String(wholePortion)
        }
        // nếu tử số lớn hơn 0
        if numerator > 0 {
            // thêm dấu cách giữa phần nguyên và phần phân số
            portion += wholePortion > 0 ? " " : ""
            //thêm phần phân số vào chuỗi kết quả
            portion += "\(numerator)/\(denominator)"
        }
        
    }
    
    // khi có unit thì thay đổi
    if var unit = ingredient.unit {
        if wholePortion > 1 {
            if unit.suffix(2) == "ch" {
                unit += "es"
            } else if unit.suffix(1) == "f" {
                unit += "ves"
            }else {
                unit += "s"
            }
        }
        portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
        return portion + unit
    }
    //khong có unit thì chỉ trả về portion
    return portion
    }
    

}
