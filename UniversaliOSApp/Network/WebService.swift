//
//  WebService.swift
//  UniversaliOSApp
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import Foundation
//    MARK:- NETWORK Requests and Data Transfer
final class WebService{

    func load<T>(resource: Resource<T>, completion: @escaping (Result<T,APIServiceError>) -> Void) {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         URLSession.shared.dataTask(with: request){ (data , resp , error) in

            guard data != nil else{
                print("data is nil")
                return
            }
            guard let amiiboList = try? JSONDecoder().decode(T.self, from: jsonValue.data(using: .utf8)!) else{
                print("could'nt decode json")
                return
            }
            completion(.success(amiiboList))
        }.resume()
    }


}
//    MARK:- Handling HTTP Status Codes
extension URLSession {
    func dataTask(with url: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            if let statusCode = (response as? HTTPURLResponse)?.statusCode, 299..<500 ~= statusCode  {
                result(.failure(APIServiceError.invalidResponse))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))

        }
    }
}
