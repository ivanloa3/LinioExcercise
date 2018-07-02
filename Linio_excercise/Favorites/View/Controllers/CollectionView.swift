//
//  FavoritesCollectionView.swift
//  Linio_excercise
//
//  Created by Ivan Lopez Ansaldo on 28/06/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

protocol UpdateFavoritesView{
    func setupViewForProducts(length: Int, height: Float)
}

class CollectionView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var contentView: UIView!
    
    var collectionView_nib : Int!
    var viewModel : FavoritesCollectionViewModel!
    var delegate : UpdateFavoritesView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func commonInit(with nibName: String){
        Bundle.main.loadNibNamed("CollectionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let nib = UINib(nibName: nibName, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        
        
        self.viewModel = FavoritesCollectionViewModel()
        self.viewModel.fetchCollections {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                if self.delegate != nil {
                    let screenRect = UIScreen.main.bounds
                    let height1 = screenRect.size.height * 0.267
                    let height2 = screenRect.size.height * 0.26097
                    let totalHeight = self.viewModel.calculateHeight(h1: Float(height1), h2: Float(height2), length: self.viewModel.getNumberOfTotalProductsInCollections())
                    self.delegate.setupViewForProducts(length: self.viewModel.getNumberOfTotalProductsInCollections(), height: totalHeight)
                }
            }
        }
        
        setupSize(with: nibName)
    }
    
    func setupSize(with nibName: String){
        let screenRect = UIScreen.main.bounds
        let width = screenRect.size.width
        let height = screenRect.size.height
        
        let flowLayout = UICollectionViewFlowLayout()
        
        if nibName == "FavoritesCollectionViewCell"{
            self.collectionView_nib = 1
            flowLayout.itemSize = CGSize(width: width * 0.464, height: height * 0.267)
            flowLayout.scrollDirection = UICollectionViewScrollDirection.horizontal
        }else if nibName == "FavoriteProductsCollectionCollectionViewCell"{
            self.collectionView_nib = 2
            flowLayout.itemSize = CGSize(width: width * 0.464, height: height * 0.26097)
            flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
            flowLayout.minimumInteritemSpacing = 0
            collectionView.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9607843137, blue: 0.9607843137, alpha: 1)

        }
        
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }

}

extension CollectionView: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.collectionView_nib == 1{
            // SHOWS NUMBER OF COLLECTIONS
            return viewModel.getNumberOfCollections()
        }else{
            // SHOWS NUMBER OF PRODUCTS IN TOTAL COLLECTIONS
            return viewModel.getNumberOfTotalProductsInCollections()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.collectionView_nib == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavoritesCollectionViewCell
            
            let title = viewModel.titleForCollectionAt(indexPath: indexPath as NSIndexPath)
            let length = viewModel.lengthForCollectionAt(indexPath: indexPath as NSIndexPath)
            let urlImages = viewModel.urlImage_recentProducts(indexPath: indexPath as NSIndexPath)
            
            cell.delegate = Service()
            cell.setProductOne(with: urlImages[0])
            cell.setProducTwo(with: urlImages[1])
            cell.setProducThree(with: urlImages[2])
            cell.setCollection(with: title, and: length)
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavoriteProductsCollectionCollectionViewCell
            
            let image = viewModel.urlImage_product(indexPath: indexPath as NSIndexPath)
            let linioPlus = viewModel.linioPlusAt(indexPath: indexPath as NSIndexPath)
            let conditionType = viewModel.conditionTypeAt(indexPath: indexPath as NSIndexPath)
            let imported = viewModel.importedAt(indexPath: indexPath as NSIndexPath)
            let freeShipping = viewModel.freeShippingAt(indexPath: indexPath as NSIndexPath)
            
            cell.delegate = Service()
            cell.setProduct(image: image)
            cell.setLinioPlus(image: linioPlus)
            cell.setConditionType(image: conditionType)
            cell.setImported(image: imported)
            cell.setFreeShipping(image: freeShipping)
            
            return cell
        }
    }
}





