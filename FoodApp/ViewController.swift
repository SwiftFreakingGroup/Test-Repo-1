//
//  ViewController.swift
//  FoodApp
//
//  Created by Yevhen Kovalov on 09.07.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        appNameLabel.text = "Home Food"
    }


    @IBAction func editButtonAction(_ sender: UIButton) {
        print("Edid button pressed")
    }
}

