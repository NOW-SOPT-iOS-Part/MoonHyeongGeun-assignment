//
//  SignUpResponseModel.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 5/10/24.
//

import Foundation

// 영화 제목을 담는 구조체
struct Movie: Codable {
    let movieNm: String
}

// API 응답 전체 구조
struct MovieResponseModel: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// 박스오피스 결과
struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [Movie]
}
