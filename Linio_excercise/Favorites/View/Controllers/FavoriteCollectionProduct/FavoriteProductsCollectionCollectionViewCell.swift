//
//  FavoriteProductsCollectionCollectionViewCell.swift
//  Linio_excercise
//
//  Created by Ivan Lopez Ansaldo on 29/06/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

protocol ProductServiceDelegate {
    func getImageData(with url: URL,completion: @escaping (Data) -> ())
}

class FavoriteProductsCollectionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var linioPlus: UIImageView!
    @IBOutlet weak var conditionType: UIImageView!
    @IBOutlet weak var imported: UIImageView!
    @IBOutlet weak var freeShipping: UIImageView!
    
    var delegate : ProductServiceDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setProduct(image: URL){
        delegate.getImageData(with: image) { (data) in
            DispatchQueue.main.async {
                self.image.image = UIImage(data: data)
            }
        }
            
    }
    
    func setLinioPlus(image: String){
        self.linioPlus.image = UIImage(named: image)
    }
    
    func setConditionType(image: String){
        self.conditionType.image = UIImage(named: image)
    }
    
    func setImported(image: String){
        self.imported.image = UIImage(named: image)
    }
    
    func setFreeShipping(image: String){
        self.freeShipping.image = UIImage(named: image)
    }

}
