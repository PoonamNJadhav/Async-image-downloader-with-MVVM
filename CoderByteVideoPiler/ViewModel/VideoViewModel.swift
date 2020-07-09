//
//  VideoViewModel.swift
//  CoderByteVideoPiler
//
//  Created by Lawand, Poonam on 09/07/20.
//  Copyright © 2020 Lawand, Poonam. All rights reserved.
//

import Foundation


enum VideoStatus : String {
    case uploaded  = "STATUS_UPLOADED"
    case none = "STATUS_NONE"
    case downloaded = "STATUS_DOWNLOADED"
    
   func getVideoStatusURL() -> URL {
        switch self {
        case .uploaded:
            return URL(string:"https://interview-images-roads.s3.amazonaws.com/STATUS_UPLOADED.png")!
        case .none:
            return URL(string:"https://interview-images-roads.s3.amazonaws.com/STATUS_DOWNLOADED.png")!
        case .downloaded:
            return URL(string:"https://interview-images-roads.s3.amazonaws.com/STATUS_NONE.png")!
   

        }
    }
}

class VideoViewModel {
    let thumbnailURL : URL?
    let createdDate : String?
    let createdTime : String?
    let fileSize : String?
    let status : VideoStatus?

    init(_ videoModel:VideoModel){
        if let videoImagePath = videoModel.thumbnail , let url = URL(string: videoImagePath) {
            thumbnailURL = url
        } else {
        thumbnailURL = nil
        }
        let videoCreatedDate = Utilities.dateConvertor(fromString:videoModel.dateTime ?? "")
        createdDate = Utilities.stringFromDate(fromDate: videoCreatedDate) //videoModel.dateTime
        createdTime = Utilities.timeFromDate(fromDate: videoCreatedDate)//videoModel.dateTime
        fileSize = videoModel.fileSize
        status = VideoStatus(rawValue: videoModel.status ?? "")
    }
           
}
