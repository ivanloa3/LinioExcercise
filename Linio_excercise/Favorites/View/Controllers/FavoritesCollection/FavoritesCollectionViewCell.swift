//
//  FavoritesCollectionViewCell.swift
//  Linio_excercise
//
//  Created by Ivan Lopez Ansaldo on 28/06/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import UIKit

protocol MyServiceDelegate {
    func getImageData(with url: URL,completion: @escaping (Data) -> ())
}

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var productOne: UIImageView!
    @IBOutlet weak var productTwo: UIImageView!
    @IBOutlet weak var productThree: UIImageView!
    
    @IBOutlet weak var collectionTitle: UILabel!
    @IBOutlet weak var collectionLength: UILabel!
    
    var delegate : MyServiceDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setProductOne(with image: URL){
        delegate.getImageData(with: image) { (data) in
            DispatchQueue.main.async {
                self.productOne.image = UIImage(data: data)
            }
            
        }
    }
    
    func setProducTwo(with image: URL){
        delegate.getImageData(with: image) { (data) in
            DispatchQueue.main.async {
                self.productTwo.image = UIImage(data: data)
            }
            
        }
    }
    
    func setProducThree(with image: URL){
        delegate.getImageData(with: image) { (data) in
            DispatchQueue.main.async {
                self.productThree.image = UIImage(data: data)
            }
            
        }
    }
    
    func setCollection(with title: String, and length: Int){
        self.collectionTitle.text = title
        self.collectionLength.text = "\(length)"
    }
}
