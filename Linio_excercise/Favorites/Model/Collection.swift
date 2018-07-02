//
//  Collection.swift
//  Linio_excercise
//
//  Created by Ivan Lopez Ansaldo on 29/06/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import Foundation

class Collection {
    
    private var Id: Int!
    private var Name: String!
    private var Description: String!
    private var Products = [Product]()
    
    init(dictionary: [String:Any]) {
        
        self.Id = dictionary["id"]! as! Int
        self.Name = dictionary["name"]! as! String
        self.Description = dictionary["description"]! as! String
        
        let temp_products = dictionary["products"] as! [String:Any]
        let keys = temp_products.keys
        
        for key in keys{
            let product_values = temp_products[key] as! [String:Any]
            let product = Product(dictionary: product_values)
            self.Products.append(product)
        }
    }
    
    var id: Int{
        get{ return self.Id }
    }
    
    var name: String{
        get{ return self.Name }
    }
    
    var description: String{
        get{ return self.Description }
    }
    
    var products: [Product]{
        get{ return self.Products }
    }
    
}
