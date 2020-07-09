//
//  Utilities.swift
//  CoderByteVideoPiler
//
//  Created by Lawand, Poonam on 09/07/20.
//  Copyright © 2020 Lawand, Poonam. All rights reserved.
//

import Foundation

class Utilities {

    class func dateConvertor(fromString:String)->Date {
       var date = Date()
       let dateFormatter = DateFormatter()
       dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
       dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" //2020-04-15T02:55:49.006Z
       date = dateFormatter.date(from:fromString)!
       return date
   }

    class func timeFromDate(fromDate:Date)->String {
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
       return dateFormatter.string(from: Date())
       
    }
    class func stringFromDate(fromDate:Date)->String {
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
       return dateFormatter.string(from: Date())
       
    }
}
