//
//  MealCategoryViewModel.swift
//  fetch-rewards-coding-challenge
//
//  Created by Jose Garcia on 6/13/22.
//

import Foundation

class MealDescriptionViewModel {
    
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String
    let strYoutube: String
    let strIngredient: String
    let strMeasure: String
    let strSource: String
    let strImageSource: String
    let strCreativeCommonsConfirmed: String
    let dateModified: String
    
    init(mealDetails: MealDetailsResponse) {
        idMeal = Self.configureValue(value: (mealDetails.meals[0]?.idMeal), label: Constants.id)
        self.strMeal = Self.configureValue(value: (mealDetails.meals[0]?.strMeal), label: Constants.meal)
        self.strDrinkAlternate = Self.configureValue(value: (mealDetails.meals[0]?.strDrinkAlternate), label: Constants.drink)
        self.strCategory = Self.configureValue(value: (mealDetails.meals[0]?.strCategory), label: Constants.category)
        self.strArea = Self.configureValue(value: (mealDetails.meals[0]?.strArea), label: Constants.area)
        self.strInstructions = Self.configureValue(value: (mealDetails.meals[0]?.strInstructions), label: Constants.instructions)
        self.strMealThumb = mealDetails.meals[0]?.strMealThumb ?? ""
        self.strTags = Self.configureValue(value: (mealDetails.meals[0]?.strTags), label: Constants.tags)
        self.strYoutube = Self.configureValue(value: (mealDetails.meals[0]?.strYoutube), label: Constants.youtube)
        self.strSource = Self.configureValue(value: (mealDetails.meals[0]?.strSource), label: Constants.imageSource)
        self.strImageSource = Self.configureValue(value: (mealDetails.meals[0]?.strImageSource), label: Constants.imageSource)
        self.strCreativeCommonsConfirmed = Self.configureValue(value: (mealDetails.meals[0]?.strCreativeCommonsConfirmed), label: Constants.creativeCommonsConfirmed)
        self.dateModified = Self.configureValue(value: (mealDetails.meals[0]?.dateModified), label: Constants.dateModified)
        
        
        self.strIngredient = Self.configureList(list: [ mealDetails.meals[0]?.strIngredient1,
                                                           mealDetails.meals[0]?.strIngredient2,
                                                           mealDetails.meals[0]?.strIngredient3,
                                                           mealDetails.meals[0]?.strIngredient4,
                                                           mealDetails.meals[0]?.strIngredient5,
                                                           mealDetails.meals[0]?.strIngredient6,
                                                           mealDetails.meals[0]?.strIngredient7,
                                                           mealDetails.meals[0]?.strIngredient8,
                                                           mealDetails.meals[0]?.strIngredient9,
                                                           mealDetails.meals[0]?.strIngredient10,
                                                           mealDetails.meals[0]?.strIngredient11,
                                                           mealDetails.meals[0]?.strIngredient12,
                                                           mealDetails.meals[0]?.strIngredient13,
                                                           mealDetails.meals[0]?.strIngredient14,
                                                           mealDetails.meals[0]?.strIngredient15,
                                                           mealDetails.meals[0]?.strIngredient16,
                                                           mealDetails.meals[0]?.strIngredient17,
                                                           mealDetails.meals[0]?.strIngredient18,
                                                           mealDetails.meals[0]?.strIngredient19,
                                                           mealDetails.meals[0]?.strIngredient20],
                                                label: Constants.ingredients)
        
        self.strMeasure = Self.configureList(list: [ mealDetails.meals[0]?.strMeasure1,
                                                mealDetails.meals[0]?.strMeasure2,
                                                mealDetails.meals[0]?.strMeasure3,
                                                mealDetails.meals[0]?.strMeasure4,
                                                mealDetails.meals[0]?.strMeasure5,
                                                mealDetails.meals[0]?.strMeasure6,
                                                mealDetails.meals[0]?.strMeasure7,
                                                mealDetails.meals[0]?.strMeasure8,
                                                mealDetails.meals[0]?.strMeasure9,
                                                mealDetails.meals[0]?.strMeasure10,
                                                mealDetails.meals[0]?.strMeasure11,
                                                mealDetails.meals[0]?.strMeasure12,
                                                mealDetails.meals[0]?.strMeasure13,
                                                mealDetails.meals[0]?.strMeasure14,
                                                mealDetails.meals[0]?.strMeasure15,
                                                mealDetails.meals[0]?.strMeasure16,
                                                mealDetails.meals[0]?.strMeasure17,
                                                mealDetails.meals[0]?.strMeasure18,
                                                mealDetails.meals[0]?.strMeasure19,
                                                mealDetails.meals[0]?.strMeasure20],
                                             label: Constants.measurements)
    }
    
    private static func configureValue(value: String?, label: String) -> String {
        guard let value = value else {
            return label + Constants.notAvailable
        }
        
        if value.isEmpty {
            return label + Constants.notAvailable
        } else {
            return label + " " + value
        }
        
        
    }
    
    private static func configureList(list: [String?], label: String) -> String {
        var listString = label + ": "
        
        for item in list {
            if let item = item {
                if !item.isEmpty && item != " " {
                    
                    listString += item + ", "
                }
            }
        }
        
        return listString
    }
    
}
