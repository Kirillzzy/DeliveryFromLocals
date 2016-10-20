//
//  CatigoryViewController.swift
//  DeliveryFromLoacls
//
//  Created by Kirill Averyanov on 20/10/16.
//  Copyright © 2016 Kirill Averyanov. All rights reserved.
//

import UIKit
import SwiftyJSON

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    
    var items = [String]()
    let photos: [String: [UIImage]] =
        ["moscow": [#imageLiteral(resourceName: "borch"), #imageLiteral(resourceName: "chicken"), #imageLiteral(resourceName: "kebab"), #imageLiteral(resourceName: "koruchka")],
         "spb": [#imageLiteral(resourceName: "kotleti"), #imageLiteral(resourceName: "krasnaya_ikra"), #imageLiteral(resourceName: "kvashenya kapusta"), #imageLiteral(resourceName: "olivie")],
         "ekb": [#imageLiteral(resourceName: "ogurchiki"), #imageLiteral(resourceName: "ovsianka"), #imageLiteral(resourceName: "pancake"), #imageLiteral(resourceName: "patato")],
         "kazan": [#imageLiteral(resourceName: "pelmeni"), #imageLiteral(resourceName: "schi"), #imageLiteral(resourceName: "solianka"), #imageLiteral(resourceName: "seledjka_shuba")]]
    
    let forSegue = ["from1Dish", "from2Dish", "from3Dish", "from4Dish"]
    let height = 170
    let myJson = getJsonData()
    
    var city: String = "city"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in myJson.getCityNames(){
            if city == i{
                items = myJson.getFoodNames(cityName: city)
                break
            }
        }
        categoryTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        categoryTable.rowHeight = CGFloat(height)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = categoryTable.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        for i in 0..<items.count{
            if  items[i] == cell.textLabel?.text{
                let image: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width + CGFloat(height), height: cell.frame.height + CGFloat(height - 40)))
                image.image = photos[items[i]]?[0]
                cell.backgroundView = UIView()
                cell.backgroundView!.addSubview(image)
                cell.textLabel?.textColor = UIColor.white
                cell.textLabel?.font = cell.textLabel?.font.withSize(30)
                break
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoryTable.deselectRow(at: indexPath, animated: true)
        for i in 0..<items.count{
            if items[i] == categoryTable.cellForRow(at: indexPath)?.textLabel?.text{
                //performSegue(withIdentifier: forSegue[i], sender: items[i])
                break;
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "from1Dish"{
     if let vc = segue.destination as? DishViewController{
     if let title = sender as? String{
     vc.title = title
     vc.numberOfDish = 1
     //vc.imageWiew.image = firstDish.backgroundImage(for: .normal)
     }
     }
     }
     else if segue.identifier == "from2Dish"{
     if let vc = segue.destination as? DishViewController{
     if let title = sender as? String{
     vc.title = title
     vc.numberOfDish = 2
     }
     }
     }
     else if segue.identifier == "from3Dish"{
     if let vc = segue.destination as? DishViewController{
     if let title = sender as? String{
     vc.title = title
     vc.numberOfDish = 3
     }
     }
     }
     else if segue.identifier == "from4Dish"{
     if let vc = segue.destination as? DishViewController{
     if let title = sender as? String{
     vc.title = title
     vc.numberOfDish = 4
     }
     }
     }
     
     }*/
    
    
}


