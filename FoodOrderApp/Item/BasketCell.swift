//
//  BasketCell.swift
//  FoodOrderApp
//
//  Created by ferid on 21.12.24.
//

import UIKit

class BasketCell: UITableViewCell {
    
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodName: UILabel!
    
    @IBOutlet weak var foodCount: UILabel!
    
    var addFood:(() -> Void)?
    var deleteFood:(() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func enterData (imageSet:String, labelSet:String, count:String) {
        foodImage.image = UIImage(named: imageSet)
        foodName.text = labelSet
        foodCount.text = count
    }
    
    @IBAction func deleteFoodButtonTapped(_ sender: Any) {
        deleteFood?()
    }
    @IBAction func addFoodButtonTapped(_ sender: Any) {
        addFood?()
    }
}
