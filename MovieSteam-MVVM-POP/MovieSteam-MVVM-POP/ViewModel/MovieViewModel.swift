//
//  MovieViewModel.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 23/09/2022.
//

import Foundation


struct ShoppingCartViewModel {
    
    var addedToBasket: [ShoppingCart]
    
    func rowNumberOfSection() -> Int {
        return self.addedToBasket.count
    }
    
    mutating func deleteMovie(_ row:Int) -> Double {
        addedToBasket.remove(at:row)
        return totalPayment()
    }
    
    func movieAtIndex(_ index:Int) -> ShoppingCart {
        let movieAtIndex = addedToBasket[index]
        return movieAtIndex
    }
    
    mutating func addNew(name: String, price: String) {
        self.addedToBasket.append(contentsOf: [ShoppingCart.init(movieName: name, MoviePrice: price)])
    }
    
    func totalPayment() -> Double {
        var total = 0.0
        for i in 0..<self.addedToBasket.count {
            let eachTotal = Double(addedToBasket[i].MoviePrice)!
            total += eachTotal
        }
        return total
    }
}

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

struct MovieListViewModel {             
    var movieDataList: [MovieModel]
    func rowNumberSection() -> Int {
        return self.movieDataList.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movieDataList[index]
        return MovieViewModel(movie)
    }
    
}
