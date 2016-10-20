//
//  getJsonData.swift
//  DeliveryFromLoacls
//
//  Created by Kirill Averyanov on 18/10/2016.
//  Copyright © 2016 Kirill Averyanov. All rights reserved.
//

import Foundation
import SwiftyJSON

class getJsonData{
    init(){}
    
    func getFoodNames(cityName: String) -> [String]{
        let json = readFromFile()
        var values = [String]()
        for i in json[0]["cities"][cityName]{
            values.append(String(describing: i))
        }
        return values
    }
    
    func getCityNames() -> [String]{
        let json = readFromFile()
        var values = [String]()
        for i in json[0]{
            values.append(String(describing: i))
        }
        return values
    }
    
    func getFullFoodName(city: String, foodName: String) -> String{
        let json = readFromFile()
        return json[0][city][foodName]["foodname"].string!
    }
    
    func getFoodPrice(city: String, foodName: String) -> String{
        let json = readFromFile()
        return json[0][city][foodName]["price"].string!
    }
    
    func getFoodDiscription(city: String, foodName: String) -> String{
        let json = readFromFile()
        return json[0][city][foodName]["discription"].string!
    }
    
    func readFromFile() -> JSON{
        let path = Bundle.main.path(forResource: "contents", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data: data as! Data)
        return json
    }
    
}
