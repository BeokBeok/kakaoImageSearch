//
//  ImageItem.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/01/06.
//

import Foundation

struct ImageItem: Decodable {
    let collection: String
    let thumbnailUrl: String
    let imageUrl: String
    let width: Int
    let height: Int
    let displaySitename: String
    let docUrl: String
    let datetime: String
    
    private enum CodingKeys: String, CodingKey {
        case collection
        case thumbnailUrl = "thumbnail_url"
        case imageUrl = "image_url"
        case width
        case height
        case displaySitename = "display_sitename"
        case docUrl = "doc_url"
        case datetime
    }
}
