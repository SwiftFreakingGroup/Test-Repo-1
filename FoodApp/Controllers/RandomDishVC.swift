//
//  Second VC.swift
//  FoodApp
//
//  Created by Yevhen Kovalov on 09.07.2024.
//

import UIKit

class RandomDishVC: UIViewController {
    
    @IBOutlet weak var dishNameLabel: UILabel!
    @IBOutlet weak var dishDescriptionLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    
    var dishName: String?
    var dishDescription: String?
    var dishImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dishNameLabel.text = dishName
        dishDescriptionLabel.text = dishDescription
        dishImageView.image = dishImage
    }
    
    
    @IBAction func mainPagePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
