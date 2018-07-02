//
//  Service.swift
//  Linio_excercise
//
//  Created by Ivan Lopez Ansaldo on 29/06/18.
//  Copyright © 2018 Ivan Lopez Ansaldo. All rights reserved.
//

import Foundation

class Service {
    
    func fetchData(completion: @escaping ([Collection]) -> ()){
        
        var collectionsProducts = [Collection]()
        
        guard let url = URL(string: "https://gist.githubusercontent.com/egteja/98ad43f47d40b0868d8a954385b5f83a/raw/5c00958f81f81d6ba0bb1b1469c905270e8cdfed/wishlist.json") else { return }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        session.dataTask(with: request) {(data, response, error) in
            if let response = response{
                print("Response: \(response)")
            }
            
            if let data = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [Any]
                    print("JSON: \(json)")
                    
                    for i in 0 ... json.count-1{
                        let dictionary = json[i] as! [String:Any]
                        let collection = Collection(dictionary: dictionary)
                        collectionsProducts.append(collection)
                    }
                    completion(collectionsProducts)
                }catch{
                    print("Error: \(error)")
                }
            }
            }.resume()
    }
}

extension Service : MyServiceDelegate, ProductServiceDelegate{
    
    func getImageData(with url: URL,completion: @escaping (Data) -> ()){
        
        let session = URLSession(configuration: .default)
        
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        completion(imageData)
                        // Do something with your image.
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        downloadPicTask.resume()
    }
    
}
