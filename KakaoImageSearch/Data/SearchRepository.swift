//
//  SearchRepository.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/03/13.
//

import RxSwift

struct SearchRepository: SearchRepositoryType {
    
    private let searchRemoteDataSource: SearchRemoteDataSourceType
    
    init(searchRemoteDataSource: SearchRemoteDataSourceType = SearchRemoteDataSource()) {
        self.searchRemoteDataSource = searchRemoteDataSource
    }
    
    func search(keyword: String, page: Int, size: Int) -> Single<ImageResponse> {
        return searchRemoteDataSource
            .search(keyword: keyword, page: page, size: size)
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
    }
}
