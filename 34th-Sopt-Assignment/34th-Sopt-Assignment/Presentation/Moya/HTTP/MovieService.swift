//
//  MovieService.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 5/10/24.
//

import Foundation
import Moya

class MovieService {
    private let provider = MoyaProvider<MovieAPI>(plugins: [MoyaLoggingPlugin()])

    func fetchMovies(date: String, itemPerPage: Int, completion: @escaping (Result<MovieResponseModel, MoyaError>) -> Void) {
        provider.request(.fetchMovies(date: date, itemPerPage: itemPerPage)) { result in
            switch result {
            case .success(let response):
                do {
                    let movies = try JSONDecoder().decode(MovieResponseModel.self, from: response.data)
                    completion(.success(movies))
                } catch {
                    completion(.failure(MoyaError.jsonMapping(response)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
