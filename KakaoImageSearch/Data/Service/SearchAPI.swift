//
//  SearchAPI.swift
//  KakaoImageSearch
//
//  Created by 강현석 on 2021/02/01.
//

import Alamofire

final class SearchAPI : SearchAPIType {
    private static let BASE_URL = "https://dapi.kakao.com"
    private static let DOMAIN = "/v2/search/image"
    
    func search(
        keyword: String,
        page: Int = 1,
        size: Int = 10
    ) -> Alamofire.DataRequest {
        let apiKey = Bundle.main.infoDictionary?["KAKAO_API_KEY"] as? String ?? ""
        return AF
            .request(
                SearchAPI.BASE_URL + SearchAPI.DOMAIN,
                method: .get,
                parameters: [
                    "query": keyword.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? "",
                    "page": page,
                    "size": size
                ],
                headers: ["Authorization" : "KakaoAK \(apiKey)"]
            )
            .validate()
    }
}
