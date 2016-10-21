//
//  FoodViewController.swift
//  DeliveryFromLocals
//
//  Created by Kirill Averyanov on 20/10/2016.
//  Copyright © 2016 Kirill Averyanov. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    let photos: [String: [UIImage]] =
        ["Moscow": [#imageLiteral(resourceName: "borch"), #imageLiteral(resourceName: "chicken"), #imageLiteral(resourceName: "kebab"), #imageLiteral(resourceName: "koruchka")],
         "Saint-Petersburg": [#imageLiteral(resourceName: "kotleti"), #imageLiteral(resourceName: "krasnaya_ikra"), #imageLiteral(resourceName: "kvashenya kapusta"), #imageLiteral(resourceName: "olivie")],
         "Ekaterinburg": [#imageLiteral(resourceName: "ogurchiki"), #imageLiteral(resourceName: "ovsianka"), #imageLiteral(resourceName: "pancake"), #imageLiteral(resourceName: "patato")],
         "Kazan": [#imageLiteral(resourceName: "pelmeni"), #imageLiteral(resourceName: "schi"), #imageLiteral(resourceName: "solianka"), #imageLiteral(resourceName: "seledjka_shuba")]]
    
    var identifier: Int = 0
    var city: String = "city"
    var food: String = "food"
    let myJson = getJsonData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = photos[city]?[identifier]
        textField.text = myJson.getFoodDiscription(cityName: city, foodName: food)
    }


    
    @IBAction func buyButtonPressed(_ sender: AnyObject) {
    }
    

}
