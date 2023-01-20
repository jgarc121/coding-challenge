//
//  DescriptionViewController.swift
//  fetch-rewards-coding-challenge
//
//  Created by Jose Garcia on 6/2/22.
//

import UIKit

class MealDescriptionController: UIViewController {
    
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
        let url = Constants.mealDescriptionURL + mealID
        
        networkService.fetchMealDescription(with: url) { [weak self] (result) in
            
            switch result {
            case .success(let meals):
                DispatchQueue.main.async {
                    self?.updateDetails(mealDetails: meals)
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    private func updateDetails(mealDetails: MealDetailsResponse) {
        let mealCategoryViewModel = MealDescriptionViewModel(mealDetails: mealDetails)
        
        self.id.text = mealCategoryViewModel.idMeal
        self.meal.text = mealCategoryViewModel.strMeal
        self.drink.text = mealCategoryViewModel.strDrinkAlternate
        self.category.text = mealCategoryViewModel.strCategory
        self.area.text = mealCategoryViewModel.strArea
        self.instructions.text = mealCategoryViewModel.strInstructions
        self.tags.text = mealCategoryViewModel.strTags
        self.youtube.text = mealCategoryViewModel.strYoutube
        self.source.text = mealCategoryViewModel.strSource
        self.imageSource.text = mealCategoryViewModel.strImageSource
        self.creativeCommons.text = mealCategoryViewModel.strCreativeCommonsConfirmed
        self.dateModified.text = mealCategoryViewModel.dateModified
        self.image.loadFrom(URLAddress: mealCategoryViewModel.strMealThumb)
        self.ingredients.text = mealCategoryViewModel.strIngredient
        self.measurements.text = mealCategoryViewModel.strMeasure
    }
}
