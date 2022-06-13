//
//  ViewController.swift
//  fetch-rewards-coding-challenge
//
//  Created by Jose Garcia on 5/31/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var mealResponseData: MealCategoryResponse?
    var mealImages: UIImageView?
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        registerCells()
        fetchData()
    }
    
// MARK: - Tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let mealResponseData = mealResponseData else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath) as! MealCell
        
        
        cell.setupMealCell(meal: (mealResponseData.meals[indexPath.row]), image:nil)
        cell.thumbnail.loadFrom(URLAddress: mealResponseData.meals[indexPath.row].strMealThumb ?? "")
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealResponseData?.meals.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MealCell
        
        guard let cellId = cell.getId() else{
            return
        }
        
        presentDescriptionViewController(mealID: cellId)
    }
// MARK: - Private
    private func presentDescriptionViewController(mealID: String) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let modal = mainStoryboard.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        modal.mealID = mealID
        modal.modalPresentationStyle = UIModalPresentationStyle.pageSheet
        self.present(modal, animated: true, completion: nil)
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func registerCells() {
        let mealCell = UINib(nibName: "MealCell", bundle: nil)
        self.tableView.register(mealCell, forCellReuseIdentifier: "MealCell")
    }
      
    private func fetchData() {
        let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        networkService.fetchMealCategory(with: url) { [weak self] (result) in
            
            switch result {
            case .success(let meals):
                self?.updateMeals(mealResponseData: meals)
                self?.fetchImage(url: meals.meals.first?.strMealThumb)
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
    
    private func updateMeals(mealResponseData: MealCategoryResponse) {
        DispatchQueue.main.async {
            self.mealResponseData = mealResponseData
            self.tableView.reloadData()
        }
    }
    
    private func fetchImage(url: String?) {
        guard let url = url else {
            return
        }
    
        mealImages?.loadFrom(URLAddress: url)
    }
}
