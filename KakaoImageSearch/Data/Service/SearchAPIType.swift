//
//  SearchAPIType.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/03/09.
//

import Alamofire

protocol SearchAPIType {
    
    func search(
        keyword: String,
        page: Int,
        size: Int
    ) -> Alamofire.DataRequest
}
