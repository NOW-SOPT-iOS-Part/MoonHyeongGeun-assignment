import UIKit
import Then
import Moya

final class MovieViewController: UIViewController{
    
    private var movieService = MovieService()
    
    private let getMovieButton =  UIButton().then{
        $0.setTitle(title: "영화 순위는?", titleColor: .black, font: .pretendardFont(weight: 500, size: 25))
        $0.backgroundColor = .white
        $0.setLayer(borderColor: .black, borderWidth: 1)
    }

    private let movie1 = UILabel().then{
        $0.setText(
            "1등",
            color: .black,
            font: UIFont.pretendardFont(weight: 500, size: 20)
        )
    }
    private let movie2 = UILabel().then{
        $0.setText(
            "2등",
            color: .black,
            font: UIFont.pretendardFont(weight: 500, size: 20)
        )
    }
    private let movie3 = UILabel().then{
        $0.setText(
            "3등",
            color: .black,
            font: UIFont.pretendardFont(weight: 500, size: 20)
        )
    }

    func setAutoLayout() {
        
        movie1.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(30)
        }
        movie2.snp.makeConstraints{
            $0.top.equalTo(movie1.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
        }
        movie3.snp.makeConstraints{
            $0.top.equalTo(movie2.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
        }
        getMovieButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(movie3.snp.bottom).offset(50)
        }
    }
    
    func setViewHierarchy() {
        view.addSubviews(movie1, movie2, movie3, getMovieButton)
    }
    
    private func setupGetMovieButton() {
        getMovieButton.addTarget(self, action: #selector(fetchMovies), for: .touchUpInside)
    }
    
    @objc func fetchMovies() {
        movieService.fetchMovies(date: "20240505", itemPerPage: 3) { [weak self] result in
            switch result {
            case .success(let movieResponse):
                DispatchQueue.main.async {
                    let movies = movieResponse.boxOfficeResult.dailyBoxOfficeList
                    if movies.count >= 3 {
                        let labels = [self?.movie1, self?.movie2, self?.movie3]
                        _ = zip(labels, movies.prefix(3)).map { (label, movie) in
                            label?.text = movie.movieNm
                        }
                    }
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setViewHierarchy()
        setAutoLayout()
        setupGetMovieButton()
    }

}
