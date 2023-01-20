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
    
    func setupMealCell(meal: Meal) {
        // TODO: Need default image if thumbnail is nil
        guard let thumbnail = meal.strMealThumb else {
            return
        }
        self.id.text = meal.idMeal
        self.name.text = meal.strMeal
        self.id.text = meal.idMeal
        self.thumbnail.loadFrom(URLAddress: thumbnail)
    }
    
    func getId() -> String? {
        return id.text
    }
    
}
