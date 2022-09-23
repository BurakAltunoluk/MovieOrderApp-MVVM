//
//  MovieViewModel.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 23/09/2022.
//

import Foundation



struct MovieViewModel {
    
    var movieData : MovieModel
    
    var movieName: String {
        return self.movieData.nameOfMovie
    }
    
    var movieDetail: String {
        return self.movieData.details
    }
    
    var movieImageUrl: String {
        return self.movieData.pictureUrl
    }
    var moviePrice: String {
        return self.movieData.price
    }
    
    init(_ movie: MovieModel){
        self.movieData = movie
    }
    
}

struct MovieListViewModel {             // Film listesi
    var movieDataList: [MovieModel]
    
    func rowNumberSection() -> Int {
        return self.movieDataList.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movieDataList[index]
        return MovieViewModel(movie)
    }
    
}
