//
//  MealCell.swift
//  fetch-rewards-coding-challenge
//
//  Created by Jose Garcia on 5/31/22.
//

import UIKit

class MealCell: UITableViewCell {
    
    @IBOutlet var thumbnail: UIImageView!
    @IBOutlet private var name: UILabel!
    @IBOutlet private var id: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupMealCell(meal: Meal, image: UIImageView?) {
        self.id.text = meal.idMeal
        self.name.text = meal.strMeal
        self.id.text = meal.idMeal
    }
    
    func getId() -> String? {
        return id.text
    }
    
}
