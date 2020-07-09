//
//  ClientService.swift
//  CoderByteVideoPiler
//
//  Created by Lawand, Poonam on 09/07/20.
//  Copyright © 2020 Lawand, Poonam. All rights reserved.
//


import Foundation

class ClientService : NSObject{
    
    static let shared = ClientService() //Singleton class object
   
    func fetchVideoFiles(offSet:Int = 1,completion:@escaping (Result<Data?, Error?>) -> Void) {
        let urlString = "https://qgkpjarwfl.execute-api.us-east-1.amazonaws.com/dev/getNormalVideoFiles?offset=\(offSet)&limit=6"
        guard let url = URL(string: urlString) else { return }
        NetworkManager.shared.fetchDataWith(url, completion:completion)
    }
}

