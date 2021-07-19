//
//  MainViewModel.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/07/19.
//

import Foundation
import RxSwift

final class MainViewModel {
    
    private let searchRepository: SearchRepositoryType
    private let disposeBag = DisposeBag()
    
    var image: BehaviorSubject<ImageResponse>? = nil
    var error: BehaviorSubject<Error>? = nil
            
    init(searchRepository: SearchRepositoryType = SearchRepository()) {
        self.searchRepository = searchRepository
    }
    
    func search(keyword: String) {
        searchRepository
            .search(keyword: keyword, page: 1, size: 20)
            .observe(on: MainScheduler.instance)
            .subscribe { response in
                self.image = BehaviorSubject<ImageResponse>(value: response)
            } onFailure: { error in
                self.error = BehaviorSubject<Error>(value: error)
            }
            .disposed(by: disposeBag)
    }
}
