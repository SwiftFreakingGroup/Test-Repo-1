//
//  ViewController.swift
//  FoodApp
//
//  Created by Yevhen Kovalov on 09.07.2024.
//

import UIKit

class MainMenuVC: UIViewController {
        var alias = Alias()
    var data = Data()
    
    @IBAction func editButtonAction(_ sender: UIButton) {
        print("Edid button pressed")
    }
    
    @IBAction func randomDishPressed(_ sender: UIButton) {
        data.selectedDish = data.arrayOfDishes[Int.random(in: 0..<3)]
        
        self.performSegue(withIdentifier: alias.goToSecondVC, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == alias.goToSecondVC {
            let destinationVC = segue.destination as! RandomDishVC
            if data.selectedDish != nil {
                let unwrappedDish = data.selectedDish!
                
                destinationVC.dishName = unwrappedDish.name
                destinationVC.dishDescription = unwrappedDish.descriptionOfDish
                destinationVC.dishImage = unwrappedDish.image
            } else {
                print("selectedDish is nil")
            }
        }
    }
    
    
}


