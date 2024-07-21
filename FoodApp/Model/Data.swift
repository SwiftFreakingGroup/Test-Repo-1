//
//  Data.swift
//  FoodApp
//
//  Created by Jan Kruchina on 17.07.2024.
//

import UIKit

struct Data {
    var arrayOfDishes: [Dish] =
    [
        Dish(name: "Spaghetti Carbonara", descriptionOfDish: "just spaghetti and tomato soup", image: UIImage(named: "Spaghetti_Carbonara")!, cuisine: "Italian"),
        Dish(name: "Pizza Margherita", descriptionOfDish: "pizza plus something on top", image: UIImage(named: "Pizza_Margherita")!, cuisine: "Italian"),
        Dish(name: "Cheeseburger", descriptionOfDish: "cheeseburger, bacon and stuff", image: UIImage(named: "Cheeseburger")!, cuisine: "American")
    ]
    
    var selectedDish: Dish?
    
}
