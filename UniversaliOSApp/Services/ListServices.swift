//
//  ListServices.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
import KRProgressHUD
struct ListServices {
    
    func loadUserList(completion: @escaping(Result<Title,APIServiceError>) ->()){
        let url = URL(string: WebServiceURLS.kBaseUrl)
        let resource = Resource<Title>(url: url!)
        KRProgressHUD.showMessage(GlobalConstants.KFetchingData)
        WebService().load(resource: resource) { result in
            switch result {
            case .success(let user) :
                DispatchQueue.main.async {
                let abc =  user
                KRProgressHUD.dismiss()
                    completion(.success(abc))}
                //            completion(.success(user))
                
            case  .failure(let error) :
                KRProgressHUD.dismiss()
                completion(.failure(error))
            }
        }
    }
    
}
