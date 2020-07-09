//
//  NetworkManager.swift
//  CoderByteVideoPiler
//
//  Created by Lawand, Poonam on 09/07/20.
//  Copyright © 2020 Lawand, Poonam. All rights reserved.
//

import Foundation

enum Result <T, E>{
    case success(T)
    case error(E)
}

protocol NetworkManagerProtocol {
    
    func fetchDataWith(_ url:URL,completion: @escaping (Result<Data?, Error?>) -> Void)
}

class NetworkManager: NSObject{
    
    // Create a singleton
    private override init() {
        
    }
    static let shared = NetworkManager()
    
    
}

extension NetworkManager: NetworkManagerProtocol{
    
    func fetchDataWith(_ url:URL,completion: @escaping (Result<Data?, Error?>) -> Void) {
    
        let request = self.createRequest(url)
        URLSession.shared.dataTask(with: request, completionHandler: {data, response, error -> Void in
               if let err = error {
                                 completion(.error(err))
                                  return
                              }
                //response parsing
                
                guard let data = data else { return }
                do {
                    completion(.success(data))
                } catch let jsonErr {
                    completion(.error(jsonErr))
                }
        
                }).resume()
    }
    
    func createRequest(_ withURL:URL) -> URLRequest {
        var request = URLRequest(url:withURL)
        request.httpMethod = "GET"
        request.setValue("jvmNAyPNr1JhiCeUlYmB2ae517p3Th0aGG6syqMb", forHTTPHeaderField: "x-api-key")
       return request
    }
    
}
