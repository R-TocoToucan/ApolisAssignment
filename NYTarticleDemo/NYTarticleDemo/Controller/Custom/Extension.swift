//
//  Extension.swift
//  NYTarticleDemo
//
//  Created by Minseok Choi on 10/15/21.
//

import UIKit

extension UIImageView {
    
    func imageFromServerURL(_ URLString: String) {
        
        let image_url = URLString
        
        if let url = URL(string: image_url) {
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
    
}
