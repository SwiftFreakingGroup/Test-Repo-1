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
    var getIP = Model()
    @IBAction func editButtonAction(_ sender: UIButton) {
        print("Edid button pressed")
    }
    
    @IBAction func randomDishPressed(_ sender: UIButton) {
        data.selectedDish = data.arrayOfDishes[Int.random(in: 0..<3)]
        
        self.performSegue(withIdentifier: alias.goToSecondVC, sender: self)
        
        //MARK: - Parsing JSON
        let urlString = "https://timeapi.io/api/Time/current/ip?ipAddress=\(getIP.getIPAddress())"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("Error: no data")
                return
            }
            do {
                let time = try JSONDecoder().decode(Time.self, from: data)
                print(time.time)
            } catch {
                print(error)
            }
            
            
        } .resume()
        
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


