//
//  ViewController.swift
//  DeliveryFromLoacls
//
//  Created by Kirill Averyanov on 03/10/16.
//  Copyright © 2016 Kirill Averyanov. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var citiesTable: UITableView!
    
    let items: [String] = ["Moscow", "Saint-Petersburg", "Ekaterinburg", "Kazan"]
    let photos: [UIImage] = [#imageLiteral(resourceName: "moscow"), #imageLiteral(resourceName: "spb"), #imageLiteral(resourceName: "ekb"), #imageLiteral(resourceName: "kazan")]
    let forSegue: [String] = ["moscowSegue", "spbSegue", "ekbSegue", "kazanSegue"]
    let height = 170
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        citiesTable.rowHeight = CGFloat(height)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = citiesTable.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row]
        for i in 0..<items.count{
            if  items[i] == cell.textLabel?.text{
                let image: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width + CGFloat(height), height: cell.frame.height + CGFloat(height - 40)))
                image.image = photos[i]
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
        citiesTable.deselectRow(at: indexPath, animated: true)
        for i in 0..<items.count{
            if items[i] == citiesTable.cellForRow(at: indexPath)?.textLabel?.text{
                performSegue(withIdentifier: forSegue[i], sender: items[i])
                break;
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        for i in 0..<forSegue.count{
            if segue.identifier == "fromCities"{
                if let vc = segue.destination as? CategoryViewController{
                    if let title = sender as? String{
                        vc.title = title
                        vc.city = forSegue[i].replacingOccurrences(of: "Segue", with: "")
                    }
                }
            }
        }
    }
    
    
    
    
}

