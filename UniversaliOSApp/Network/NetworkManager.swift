//
//  NetworkManager.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


struct Resource<T: Decodable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}

extension Resource {
    init(url: URL){
        self.url = url
    }
}

enum APIServiceError: Error {
 case apiError
 case invalidEndpoint
 case invalidResponse
 case noData
 case decodeError
 case logout

    var localizedDescription: String
    {
        switch self {
        case .apiError:  return "Request Failed"
        case .invalidEndpoint: return "Invalid Data"
        case .invalidResponse: return "Response Unsuccessful"
        case .decodeError: return "JSON Conversion Failure"
        case .noData: return "No data found"
        case .logout: return "logout"

        }
    }

}

class NetworkManager{
    static func jsonData(completion : ((_ json : Data?) -> Void)){
        completion(Data(jsonValue.utf8))
    }
}
