//
//  HomeController.swift
//  FoodOrderApp
//
//  Created by ferid on 08.12.24.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureItems()
    }
    
    func configureUI() {
        title = "Menu"
        
        homeViewModel.getMenu {
            collectionView.reloadData()
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func configureItems() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(basketButtonTapped))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func basketButtonTapped() {
        let controller = storyboard?.instantiateViewController(identifier: "BasketController") as! BasketController
       
        navigationController?.show(controller, sender: nil)
    }
}
extension HomeController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel.changedMenu().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
      
        item.enterData(imageSet: homeViewModel.changedMenu()[indexPath.item].categoryImage,
                       labelSet: homeViewModel.changedMenu()[indexPath.row].categoryName,
                       addbuttonIsHidden: true)
        return item
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "FoodController") as! FoodController
        controller.foodModel.foods = homeViewModel.changedMenu()[indexPath.item].foods
        navigationController?.show(controller, sender: nil)
    }
}
    
    

