//
//  UIImage+Extensions.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
import UIKit
import KRProgressHUD
import SDWebImage

let imageCache = NSCache<AnyObject,AnyObject>()
var task : URLSessionDataTask!
let spinner = UIActivityIndicatorView(style: .gray)


extension UIImageView{
    func loadImages(url : URL){
        image = nil
        addSpinner()
        if let task = task {
            task.cancel()
        }
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject)  as? UIImage{
            self.image = imageFromCache
            return
        }
        task = URLSession.shared.dataTask(with: url){ (data, response , error) in
            guard let data = data , let newImage = UIImage(data: data) else{
                return
            }
            imageCache.setObject(newImage , forKey:  url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                self.image = newImage
                self.removeSpinner()
            }
            
        }
        task.resume()
    }
    func addSpinner(){
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.startAnimating()
    }
    func removeSpinner(){
        spinner.removeFromSuperview()
    }
}
