//
//  FavoritesViewController.swift
//  Linio_excercise
//
//  Created by Ivan Lopez Ansaldo on 28/06/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

class FavoritesViewController : UIViewController{
    
    @IBOutlet weak var favoriteCollections: CollectionView!
    @IBOutlet weak var favoriteProductsCollection: CollectionView!
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    @IBOutlet weak var favoriteCollectionsHeight: CollectionView!
    @IBOutlet weak var numberProducts: UILabel!
    
    var collections : [Collection]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favoriteCollections.commonInit(with: "FavoritesCollectionViewCell")
        self.favoriteProductsCollection.commonInit(with: "FavoriteProductsCollectionCollectionViewCell")
        favoriteProductsCollection.delegate = self
    }
}

extension FavoritesViewController : UpdateFavoritesView{
    func setupViewForProducts(length: Int, height: Float) {
        self.numberProducts.text = "Todos mis favoritos (\(length))"
        self.scrollHeight.constant = CGFloat(height)
    }

}
