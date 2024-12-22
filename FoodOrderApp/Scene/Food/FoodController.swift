//
//  FoodController.swift
//  FoodOrderApp
//
//  Created by ferid on 08.12.24.
//

import UIKit

class FoodController: UIViewController {
   
    @IBOutlet weak var foodCollection: UICollectionView!
    
    var foodModel = FoodViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        
    }
    func configureUi() {
        foodCollection.delegate = self
        foodCollection.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        foodCollection.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
}
extension FoodController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodModel.foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = foodCollection.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        item.food = foodModel.foods[indexPath.item]
        item.enterData(imageSet: foodModel.foods[indexPath.item].foodImage, labelSet: foodModel.foods[indexPath.item].foodName, addbuttonIsHidden: false)
        item.addToBasketHandler = {
            self.foodModel.addItemToBasket(index: indexPath.item)
            self.showAlert(title: "Added", message: "Chosen Food Added")
        }
        return item
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    

}
