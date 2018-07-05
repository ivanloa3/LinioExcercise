//
//  Product.swift
//  Linio_excercise
//
//  Created by Ivan Lopez Ansaldo on 29/06/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import Foundation
import SwiftyJSON

class Product {
    
    private var Id: Int!
    private var Name: String!
    private var WishListPrice: Int!
    private var Slug: String!
    private var Url: String!
    private var Image: String!
    private var LinioPlusLevel: Int!
    private var ConditionType: String!
    private var FreeShipping: Bool!
    private var Imported: Bool!
    private var Active: Bool!
    
//    init(dictionary: [String:Any]){
//        
//        self.Id = dictionary["id"]! as! Int
//        self.Name = dictionary["name"]! as! String
//        self.WishListPrice = dictionary["wishListPrice"]! as! Int
//        self.Slug = dictionary["slug"]! as! String
//        self.Url = dictionary["url"]! as! String
//        self.Image = dictionary["image"]! as! String
//        self.LinioPlusLevel = dictionary["linioPlusLevel"] as! Int
//        self.ConditionType = dictionary["conditionType"] as! String
//        self.FreeShipping = dictionary["freeShipping"] as! Bool
//        self.Imported = dictionary["imported"] as! Bool
//        self.Active = dictionary["active"] as! Bool
//    }
    
    init(json: JSON) {
        self.Id = json["id"].int
        self.Name = json["name"].stringValue
        self.WishListPrice = json["wishListPrice"].int
        self.Slug = json["slug"].stringValue
        self.Url = json["url"].stringValue
        self.Image = json["image"].stringValue
        self.LinioPlusLevel = json["linioPlusLevel"].int
        self.ConditionType = json["conditionType"].stringValue
        self.FreeShipping = json["freeShipping"].bool
        self.Imported = json["imported"].bool
        self.Active = json["active"].bool
        
    }
    
    var id: Int{
        get{ return self.Id }
    }
    
    var name: String{
        get{ return self.Name }
    }
    
    var wishListPrice: Int{
        get{ return self.WishListPrice }
    }
    
    var slug: String{
        get{ return self.Slug }
    }
    
    var url: String{
        get{ return self.Url }
    }
    
    var image: String{
        get{ return self.Image }
    }
    
    var linioPlusLevel: Int{
        get{ return self.LinioPlusLevel }
    }
    
    var conditionType: String{
        get{ return self.ConditionType }
    }
    
    var freeShipping: Bool{
        get{ return self.FreeShipping }
    }
    
    var imported: Bool{
        get{ return self.Imported }
    }
    
    var active: Bool{
        get{ return self.Active }
    }
    
}
