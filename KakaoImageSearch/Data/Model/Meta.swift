//
//  Meta.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/01/06.
//

import Foundation

struct Meta: Codable {
    let totalCount: Int
    let pageableCount: Int
    let isEnd: Bool
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case pageableCount = "pageable_count"
        case isEnd = "is_end"
    }
}
