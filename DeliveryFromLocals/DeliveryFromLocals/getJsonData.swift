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
        for i in json["cities"].arrayValue{
            if i["cityname"].stringValue == cityName{
                for j in i["food"].arrayValue{
                    values.append(j["foodname"].stringValue)
                }
                break
            }
        }
        return values
    }
    
    func getCityNames() -> [String]{
        let json = readFromFile()
        var values = [String]()
        for i in json["cities"].arrayValue{
            values.append(i["cityname"].stringValue)
        }
        return values
    }
    
   
    func getFoodPrice(cityName: String, foodName: String) -> String{
        let json = readFromFile()
        var price: String = ""
        for i in json["cities"].arrayValue{
            if i["cityname"].stringValue == cityName {
                for j in i["food"].arrayValue{
                    if j["foodname"].stringValue == foodName{
                        price = j["price"].stringValue
                        break
                    }
                }
            }
        }
        return price
    }
    
    func getFoodDiscription(cityName: String, foodName: String) -> String{
        let json = readFromFile()
        var description: String = ""
        for i in json["cities"].arrayValue{
            if i["cityname"].stringValue == cityName {
                for j in i["food"].arrayValue{
                    if j["foodname"].stringValue == foodName{
                        description = j["description"].stringValue
                        break
                    }
                }
            }
        }
        return description
    }
    
    func readFromFile() -> JSON{
        /*
        if let path = Bundle.main.path(forResource: "contents", ofType: "json"){
            if let data = NSData(contentsOfFile: path){
                print("path \(path)")
                let json = JSON(data: data as Data)
                return json
            }
        }
        return nil*/
        let information: String =
        "{\"cities\": [{\"food\": [{\"foodname\": \"Borscht\",\"price\": 250.0,\"description\": \"Borscht is a sour russian soup. Borscht derives from an ancient soup originally cooked from pickled stems, leaves and umbels of common hogweed, a herbaceous plant growing in damp meadows, which lent the dish its Slavic name.\",\"image\": \"\"},{\"foodname\": \"Roasted chicken breasts\",\"price\": 350.0,\"description\": \"Chicken is the most common type of poultry in the world.In developed countries, chickens are usually subject to intensive farming methods.\",\"image\": \"\"},{\"foodname\": \"Russian kebab\",\"price\": 300.0,\"description\": \" Kebab is a dish of pieces of meat, fish, or vegetables roasted or grilled on a skewer or spit. The dish originated in the Middle East, before spreading worldwide.\",\"image\": \"\"},{\"foodname\": \"Roasted koruchka\",\"price\": 250.0,\"description\": \"Smelts are a family of small fish, the Osmeridae, found in the Atlantic and Pacific Oceans. They are also known as freshwater smelts or typical smelts to distinguish them from the related Argentinidae, Bathylagidae, and Retropinnidae.\",\"image\": \"\"}],\"cityname\": \"Moscow\",\"description\": \"Moscow is pretty big.\",\"image\": \"\"},{\"food\": [{\"foodname\": \"Roasted russian kotltetes\",\"price\": 200.0,\"description\": \"In modern Russian, the word kotleta refers almost exclusively to pan-fried minced meat croquettes / cutlet-shaped patties. Bread soaked in milk, onions, garlic, and herbs is usually present in the recipe.\",\"image\": \"\"},{\"foodname\": \"Red caviar\",\"price\": 300.0,\"description\": \"Red caviar is a caviar made from the roe of Pacific, Atlantic and river species of salmon. Given its high price in the West, red caviar is associated with luxury and wealth, but in Russia and Japan, caviar is commonly served at holiday feasts, weddings and other festive occasions.\",\"image\": \"\"},{\"foodname\": \"Kvashenaya kapusta cabbage\",\"price\": 150.0,\"description\": \"Fall, winter and even early spring, this is the time when we are glad to see Russian cabbage on the table. Moreover, we also want to cook Russian cabbage with our hands, but don't have really good recipe or reliable sour vegetable recipe.\",\"image\": \"\"},{\"foodname\": \"Olivie salad\",\"price\": 200.0,\"description\": \"Today's popular version of Olivier salad — containing boiled potatoes, dill pickles, peas, eggs, carrots, and boiled beef/chicken or bologna, dressed with mayonnaise — is a version of Ivanov's Stolichny salad, and only faintly resembles Olivier's original creation.\",\"image\": \"\"}],\"cityname\": \"Saint-Petersburg\",\"description\": \"Saint-Petersburg is pretty beautiful.\",\"image\": \"\"},{\"food\": [{\"foodname\": \"Pickled russian cucumbers\",\"price\": 100.0,\"description\": \"A pickled cucumber is a cucumber that has been pickled in a brine, vinegar, or other solution and left to ferment for a period of time, by either immersing the cucumbers in an acidic solution or through souring by lacto-fermentation.\",\"image\": \"\"},{\"foodname\": \"Porridge\",\"price\": 200.0,\"description\": \"Porridge is a dish made by boiling ground, crushed, or chopped starchy plants – typically grain – in water or milk. It is often cooked or served with flavorings such as sugar, honey, etc. to make a sweet dish, or mixed with spices, vegetables, etc. to make a savoury dish. It is usually served hot in a bowl.\",\"image\": \"\"},{\"foodname\": \"Russian blini\",\"price\": 100.0,\"description\": \"A blini (sometimes spelled bliny) or, rarely, blin is a light, thin pancake, traditionally made from buckwheat flour and served with sour cream, butter, caviar, and other garnishes.It typically lacks a leavening agent.\",\"image\": \"\"},{\"foodname\": \"Russian roasted potato\",\"price\": 200.0,\"description\": \"The potato is a starchy, tuberous crop from the perennial nightshade Solanum tuberosum. The word 'potato' may refer either to the plant itself or to the edible tuber.\",\"image\": \"\"}],\"cityname\": \"Ekaterinburg\",\"description\": \"Ekaterinburg is pretty big.\",\"image\": \"\"},{\"food\": [{\"foodname\": \"Pelmeni\",\"price\": 200.0,\"description\": \"Pelmeni are dumplings consisting of a filling wrapped in thin, unleavened dough.\",\"image\": \"\"},{\"foodname\": \"Shchi\",\"price\": 250.0,\"description\": \"Shchi is a Russian style of cabbage soup. When sauerkraut is used instead, the soup is called sour shchi, while soups based on sorrel, spinach, nettle, and similar plants are called green shchi.\",\"image\": \"\"},{\"foodname\": \"Solyanka\",\"price\": 300.0,\"description\": \"Solyanka is a thick, spicy and sour Russian soup that is common in Russia and other states of the former Soviet Union and certain parts of the former Eastern Bloc.\",\"image\": \"\"},{\"foodname\": \"Dressed herring\",\"price\": 200.0,\"description\": \"Dressed herring, colloquially known as herring under a fur coat is a layered salad composed of diced pickled herring covered with layers of grated boiled vegetables (potatoes, carrots, beet roots), chopped onions, and mayonnaise.\",\"image\": \"\"}],\"cityname\": \"Kazan\",\"description\": \"Kazan is pretty famous.\",\"image\": \"\"}]}"
        
        let data = information.data(using: String.Encoding.utf8)
        let json = JSON(data: data!)
        return json
    }
    
}
