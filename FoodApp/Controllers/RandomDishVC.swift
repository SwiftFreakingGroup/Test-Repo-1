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
    @IBOutlet weak var timeLabel: UILabel!
    
    
    var getIP = Model()
    var dishName: String?
    var dishDescription: String?
    var dishImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dishNameLabel.text = dishName
        dishDescriptionLabel.text = dishDescription
        dishImageView.image = dishImage
        
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
                DispatchQueue.main.async {
                    self.timeLabel.text = time.time
                }
                print(time.time)
            } catch {
                print(error)
            }
            
            
        } .resume()
    }
    
    
    @IBAction func mainPagePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
