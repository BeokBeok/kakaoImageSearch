//
//  SearchRemoteDataSourceType.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/03/09.
//

import RxSwift

protocol SearchRemoteDataSourceType {
    
    func search(
        keyword: String,
        page: Int,
        size: Int
    ) -> Single<ImageResponse>
}
