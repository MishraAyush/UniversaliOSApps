//
//  ListServices.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
struct ListServices {
    
    func loadUserList(completion: @escaping(Result<Title,APIServiceError>) ->()){
        let url = URL(string: WebServiceURLS.kBaseUrl)
        let resource = Resource<Title>(url: url!)
        WebService().load(resource: resource) { result in
            switch result {
            case .success(let user) :
                let abc =  user
                completion(.success(abc))
                //            completion(.success(user))
                
            case  .failure(let error) :
                completion(.failure(error))
            }
        }
    }
    
}
