import UIKit

import Then
import SnapKit

final class MovieViewController: UIViewController {
    
    // MARK: - Property

    private var viewModel = MovieViewModel()
    
    // MARK: - Component
    
    private let getMovieButton = UIButton().then {
        $0.setTitle("영화 순위는?", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.pretendardFont(weight: 500, size: 25)
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.white.cgColor
        $0.layer.borderWidth = 1
    }
    
    private let movie1 = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.pretendardFont(weight: 500, size: 20)
    }
    
    private let movie2 = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.pretendardFont(weight: 500, size: 20)
    }
    
    private let movie3 = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.pretendardFont(weight: 500, size: 20)
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setUI()
        setMovieButton()
        bindViewModel()
    }

    //MARK: - Set UI
    
    private func setUI() {
        view.addSubviews(movie1, movie2, movie3, getMovieButton)
        
        movie1.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(30)
        }
        
        movie2.snp.makeConstraints {
            $0.top.equalTo(movie1.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
        }
        
        movie3.snp.makeConstraints {
            $0.top.equalTo(movie2.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(30)
        }
        
        getMovieButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(movie3.snp.bottom).offset(50)
        }
    }
    
    //MARK: - Action
    
    private func setMovieButton() {
        getMovieButton.addTarget(self, action: #selector(fetchMovies), for: .touchUpInside)
    }
    
    private func bindViewModel() {
        viewModel.onMoviesUpdated = { [weak self] in
            guard let self = self else { return }
            let labels = [self.movie1, self.movie2, self.movie3]
            _ = zip(labels, self.viewModel.movies).map { (label, movieName) in
                label.text = movieName
            }
        }
    }
    
    @objc private func fetchMovies() {
        viewModel.fetchMovies()
    }
}
