//
//  ImageResponse.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/01/06.
//

import Foundation

struct ImageResponse: Decodable {
    let documents: [ImageItem]
    let meta: Meta
    
    private enum CodingKeys: String, CodingKey {
        case documents
        case meta
    }
}
