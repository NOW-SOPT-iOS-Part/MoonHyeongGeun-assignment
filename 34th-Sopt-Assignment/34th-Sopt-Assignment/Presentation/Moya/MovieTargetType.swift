//
//  MovieTargetType.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 5/10/24.
//
import Moya
import Foundation

enum MovieAPI {
    case fetchMovies(date: String, itemPerPage: Int)
}

extension MovieAPI: TargetType{
    var baseURL: URL{
        return URL(string: Config.baseURL)!
    }
    
    var path: String{
        switch self{
        case .fetchMovies:
            return "boxoffice/searchDailyBoxOfficeList.json"
        }
    }
    
    var method: Moya.Method {
            return .get
        }
    
    var task: Task {
            switch self {
            case .fetchMovies(let date, let itemPerPage):
                return .requestParameters(
                    parameters: ["key": Config.apiKey, "targetDt": date, "itemPerPage": itemPerPage],
                    encoding: URLEncoding.queryString
                )
            }
        }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()  // 제공하는 API의 샘플 데이터
    }
    
}
