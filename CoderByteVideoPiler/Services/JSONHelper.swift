//
//  JSONHelper.swift
//  CoderByteVideoPiler
//
//  Created by Lawand, Poonam on 09/07/20.
//  Copyright © 2020 Lawand, Poonam. All rights reserved.
//

import Foundation


class JSONHelper {
        
    static let shareInstance = JSONHelper()
   
    //Parse and Save Data
    func parseJsonData(jsonData:Data) -> [VideoModel]{
        var videoModelList = [VideoModel]()
         do {
        // Parse JSON data
           videoModelList = try JSONDecoder().decode([VideoModel].self, from: jsonData)
            
         }
         catch(let ex)
         {
            print(ex.localizedDescription)
         }
            return videoModelList
        
        }
   
}
