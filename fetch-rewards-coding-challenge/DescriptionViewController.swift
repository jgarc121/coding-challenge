//
//  DescriptionViewController.swift
//  fetch-rewards-coding-challenge
//
//  Created by Jose Garcia on 6/2/22.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet var id: UILabel!
    @IBOutlet var meal: UILabel!
    @IBOutlet var drink: UILabel!
    @IBOutlet var category: UILabel!
    @IBOutlet var area: UILabel!
    @IBOutlet var instructions: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var tags: UILabel!
    @IBOutlet var youtube: UILabel!
    @IBOutlet var ingredients: UILabel!
    @IBOutlet var measurements: UILabel!
    @IBOutlet var source: UILabel!
    @IBOutlet var imageSource: UILabel!
    @IBOutlet var creativeCommons: UILabel!
    @IBOutlet var dateModified: UILabel!
    
    var mealID: String = ""
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    private func fetchData() {
        let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=" + mealID
        
        networkService.fetchMealDescription(with: url) { [weak self] (result) in
            
            switch result {
            case .success(let meals):
                self?.updateDetails(mealDetails: meals)
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    private func updateDetails(mealDetails: MealDetailsResponse) {
        DispatchQueue.main.async { [self] in
            
            self.id.text = self.configureValue(value: (mealDetails.meals[0]?.idMeal), label: "ID:")
            self.meal.text = self.configureValue(value: (mealDetails.meals[0]?.strMeal), label: "Meal:")
            self.drink.text = self.configureValue(value: (mealDetails.meals[0]?.strDrinkAlternate), label: "Drink:")
            self.category.text = self.configureValue(value: (mealDetails.meals[0]?.strCategory), label: "Category:")
            self.area.text = self.configureValue(value: (mealDetails.meals[0]?.strArea), label: "Area:")
            self.instructions.text = self.configureValue(value: (mealDetails.meals[0]?.strInstructions), label: "Instructions:")
            self.tags.text = self.configureValue(value: (mealDetails.meals[0]?.strTags), label: "Tags:")
            self.youtube.text = self.configureValue(value: (mealDetails.meals[0]?.strYoutube), label: "Youtube:")
            self.source.text = self.configureValue(value: (mealDetails.meals[0]?.strSource), label: "Source:")
            self.imageSource.text = self.configureValue(value: (mealDetails.meals[0]?.strImageSource), label: "Image Source:")
            
            self.creativeCommons.text = self.configureValue(value: (mealDetails.meals[0]?.strCreativeCommonsConfirmed), label: "Creative Commons Confirmed:")
            self.dateModified.text = self.configureValue(value: (mealDetails.meals[0]?.dateModified), label: "Date Modified:")
            self.image.loadFrom(URLAddress: mealDetails.meals[0]?.strMealThumb ?? "")
            self.ingredients.text = self.configureList(list: [ mealDetails.meals[0]?.strIngredient1,
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
                                                       label: "Ingredients")


            self.measurements.text = configureList(list: [ mealDetails.meals[0]?.strMeasure1,
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
                                                   label: "Measurements")

        }
    }
    
    private func configureValue(value: String?, label: String) -> String {
        guard let value = value else {
            return label + " N/A"
        }
        
        if value.isEmpty {
            return label + " N/A"
        } else {
            return label + " " + value
        }
        
        
    }
    
    private func configureList(list: [String?], label: String) -> String {
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
