//
//  VideoModel.swift
//  CoderByteVideoPiler
//
//  Created by Lawand, Poonam on 09/07/20.
//  Copyright © 2020 Lawand, Poonam. All rights reserved.
//

import Foundation

struct VideoModel : Codable {
        let dateTime : String?
        let status : String?
        let thumbnail : String?
        let fileSize : String?
        let id : Int?

        enum CodingKeys: String, CodingKey {

            case dateTime = "dateTime"
            case status = "status"
            case thumbnail = "thumbnail"
            case fileSize = "fileSize"
            case id = "id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            dateTime = try values.decodeIfPresent(String.self, forKey: .dateTime)
            status = try values.decodeIfPresent(String.self, forKey: .status)
            thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
            fileSize = try values.decodeIfPresent(String.self, forKey: .fileSize)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
        }

    }
