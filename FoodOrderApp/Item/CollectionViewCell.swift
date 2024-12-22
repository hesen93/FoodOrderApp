//
//  CollectionViewCell.swift
//  FoodOrderApp
//
//  Created by ferid on 08.12.24.
//

import UIKit



class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    var food:Food?
    var addToBasketHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        addToBasketHandler?()
        
    }
    
    func enterData (imageSet:String, labelSet:String, addbuttonIsHidden:Bool) {
        image.image = UIImage(named: imageSet)
        label.text = labelSet
        button.isHidden = addbuttonIsHidden
    }
}
