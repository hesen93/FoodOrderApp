//
//  BasketControllerTable.swift
//  FoodOrderApp
//
//  Created by ferid on 21.12.24.
//

import UIKit

class BasketController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalAmount: UILabel!
    
    var basketViewModel = BasketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        basketViewModel.basketItemsRead.readData { foods in
            basketViewModel.basketFoods = foods ?? [:]
            totalAmount.text = basketViewModel.calculateTotalAmount()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basketViewModel.basketFoods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketCell") as! BasketCell
        let food = Array(basketViewModel.basketFoods.keys)[indexPath.row]
        let count = basketViewModel.basketFoods[food] ?? 0
        cell.enterData(imageSet: food.foodImage, labelSet: food.foodName, count: "\(count)")
        cell.addFood = {
            self.basketViewModel.addFood(food: food)
            self.tableView.reloadData()
            self.totalAmount.text = self.basketViewModel.calculateTotalAmount()
        }
        cell.deleteFood = {
            self.basketViewModel.removeFood(food: food)
            self.tableView.reloadData()
            self.totalAmount.text = self.basketViewModel.calculateTotalAmount()
        }
        return cell
    }
}
