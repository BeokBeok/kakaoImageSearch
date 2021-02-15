//
//  KakaoApi.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/02/01.
//

import Alamofire

final class KakaoImageSearchAPI {
    private let BASE_URL = "https://dapi.kakao.com"
    private let DOMAIN = "/v2/search/image"
    
    func searchImage(
        keyword: String,
        page: Int = 1,
        size: Int = 10
    ) -> Alamofire.DataRequest {
        let apiKey = Bundle.main.infoDictionary!["KAKAO_API_KEY"] as! String
        return AF.request(
            BASE_URL + DOMAIN,
            parameters: ["query" : keyword, "page" : page, "size" : size],
            headers: ["Authorization" : "KakaoAK \(apiKey)"]
        )
    }
}
