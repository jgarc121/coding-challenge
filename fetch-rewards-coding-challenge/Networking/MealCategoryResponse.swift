//
//  MealCategoryResponse.swift
//  fetch-rewards-coding-challenge
//
//  Created by Jose Garcia on 5/31/22.
//

struct MealCategoryResponse: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?
}
