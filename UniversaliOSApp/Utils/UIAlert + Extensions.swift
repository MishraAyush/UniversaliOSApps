//
//  UIAlert + Extensions.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 29/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
func showAlert(title:String,message:String){
       let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
       let actionOk = UIAlertAction(title: "Close Application",
                                    style: .default,
                                    handler: { (action: UIAlertAction!) in
                                        
                                        exit(0)
                                        
                                        
                                    })
       
       alertController.addAction(actionOk)
       
       self.present(alertController, animated: true, completion: nil)
   }
    func showAlertAPIFailure(title:String,message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Failed To fetch",
                                     style: .default,
                                     handler: nil)
        
        alertController.addAction(actionOk)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
