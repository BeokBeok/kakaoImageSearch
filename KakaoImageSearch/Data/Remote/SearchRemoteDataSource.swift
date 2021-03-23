//
//  SearchRemoteDataSource.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/03/09.
//

import Alamofire
import RxSwift

struct SearchRemoteDataSource: SearchRemoteDataSourceType {
    
    private let apiService: SearchAPIType
    
    init(apiService: SearchAPIType = SearchAPI()) {
        self.apiService = apiService
    }
    
    func search(
        keyword: String,
        page: Int,
        size: Int
    ) -> Single<ImageResponse> {
        return Single<ImageResponse>.create { single in
            apiService
                .search(keyword: keyword, page: page, size: size)
                .responseJSON { (response) in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            single(.failure(NetworkError.unknown))
                            return
                        }
                        do {
                            let decodedResponse = try JSONDecoder().decode(ImageResponse.self, from: data)
                            single(.success(decodedResponse))
                        } catch {
                            single(.failure(NetworkError.unknown))
                        }
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            return Disposables.create()
        }
    }
}
