//
//  SearchRepositoryType.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/03/13.
//

import RxSwift

protocol SearchRepositoryType{
    
    func search(
        keyword: String,
        page: Int,
        size: Int
    ) -> Single<ImageResponse>
}
