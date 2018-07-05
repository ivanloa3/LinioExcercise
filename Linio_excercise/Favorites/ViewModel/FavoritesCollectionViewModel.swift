//
//  FavoritesCollectionViewModel.swift
//  Linio_excercise
//
//  Created by Ivan Lopez Ansaldo on 01/07/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import Foundation

class FavoritesCollectionViewModel{
    
    var collections : [Collection]!
    var products : [Product]!
    
    let service = Service()

    func fetchCollections(completion: @escaping () -> ()){
        service.fetchData_alamofire(completion:{ (data) in
            self.collections = data
            self.fetchProducts()
            completion()
        })
    }
    
    func fetchProducts(){
        self.products = [Product]()
        
        for i in 0 ... self.collections.count-1{
            let t_products = self.collections[i].products
            for j in 0 ... (t_products.count-1){
                self.products.append(t_products[j])
            }
        }
    }
    
    func getNumberOfCollections() -> Int{
        return self.collections?.count ?? 0
    }
    
    func getNumberOfTotalProductsInCollections() -> Int{
        var total = 0
        
        if collections != nil{
            for i in 0 ... self.collections.count-1{
                let nProducts = collections[i].products.count
                total = total + nProducts
            }
        }

        return total
    }
}

extension FavoritesCollectionViewModel{
    func titleForCollectionAt(indexPath: NSIndexPath) -> String{
        return collections[indexPath.row].name 
    }
    
    func lengthForCollectionAt(indexPath: NSIndexPath) -> Int{
        return collections[indexPath.row].products.count
    }
    
    func urlImage_recentProducts(indexPath: NSIndexPath) -> [URL]{
        var urlImages = [URL]()
        
        for i in 0 ... collections[indexPath.row].products.count-1{
            let urlString = collections[indexPath.row].products[i].image
            let url = URL(string: urlString)
            
            urlImages.append(url!)
        }
        
        return urlImages
    }
}

extension FavoritesCollectionViewModel{
    
    func urlImage_product(indexPath: NSIndexPath) -> URL{
        
        let urlString = products[indexPath.row].image
        return URL(string: urlString)!
        
    }
    
    func linioPlusAt(indexPath: NSIndexPath) -> String {
        let linioPlus = products[indexPath.row].linioPlusLevel
        
        switch linioPlus {
        case 0:
            return "ERROR"
        case 1:
            return "ndIc30PlusSquare"
        case 2:
            return "ndIc30Plus48Square"
        default:
            return "ERROR"
        }
    }
    
    func conditionTypeAt(indexPath: NSIndexPath) -> String{
        let conditionType = products[indexPath.row].conditionType
        
        switch conditionType {
        case "new":
            return "ndIc30NewSquare"
        case "refurbished":
            return "ndIc30RefurbishedSquare"
        default:
            return "ERROR"
        }
    }
    
    func importedAt(indexPath: NSIndexPath) -> String {
        let imported = products[indexPath.row].imported
    
        if imported {
            return "ndIc30InternationalSquare"
        }else{
            return "ERROR"
        }
    }
    
    func freeShippingAt(indexPath: NSIndexPath) -> String {
        let freeShipping = products[indexPath.row].freeShipping
        
        if freeShipping {
            return "ndIc30FreeShippingSquare"
        }else{
            return "ERROR"
        }
    }
    
    func calculateHeight(h1:Float, h2:Float, length:Int) -> Float{
        var nRows = length / 2
        if (length%2) == 1{ nRows = nRows + 1}
        
        let totalHeight = (Float(nRows)*h2)+h1+110
        
        return totalHeight
    }
}





