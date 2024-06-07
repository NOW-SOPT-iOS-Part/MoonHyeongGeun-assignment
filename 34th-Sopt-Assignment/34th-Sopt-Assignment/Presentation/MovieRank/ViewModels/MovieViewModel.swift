//
//  MovieViewModel.swift
//  34th-Sopt-Assignment
//
//  Created by Chandrala on 6/7/24.
//

import UIKit
import Moya

class MovieViewModel {
    private var movieService = MovieService()
    var movies: [String] = [] {
        didSet {
            self.onMoviesUpdated?()
        }
    }
    
    var onMoviesUpdated: (() -> Void)?
    
    func fetchMovies() {
        movieService.fetchMovies(date: "20240505", itemPerPage: 3) { [weak self] result in
            switch result {
            case .success(let movieResponse):
                let movieNames = movieResponse.boxOfficeResult.dailyBoxOfficeList.prefix(3).map { $0.movieNm }
                DispatchQueue.main.async {
                    self?.movies = movieNames
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
