//
//  DetailsVC.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 23/09/2022.
//

import UIKit

class DetailsVC: UIViewController {
    
    var movieListViewModel: MovieListViewModel!
    var rowNumber = 0
    
    @IBOutlet private var addToCartOutlet: UIButton!
    @IBOutlet private var movieDetails: UITextView!
    @IBOutlet private var movieTitle: UILabel!
    @IBOutlet private var movieImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func addToCartPressed(_ sender: UIButton) {
        
        let movieViewModel = self.movieListViewModel.movieAtIndex(rowNumber)
        temporaryData.addNew(name: movieViewModel.movieName, price: movieViewModel.moviePrice)
        print(temporaryData.addedToBasket)
        NotificationCenter.default.post(name: Notification.Name("addToCart"), object: nil)
        dismiss(animated: true)
    }
    
    private func setup() {
        if movieListViewModel != nil {
            let movieViewModel = self.movieListViewModel.movieAtIndex(rowNumber)
            movieTitle.text = movieViewModel.movieName
            let imageData = try? Data(contentsOf:URL(string:movieViewModel.movieImageUrl)!)
            movieImage.image = UIImage(data: imageData!)
            movieDetails.text = movieViewModel.movieDetail
            addToCartOutlet.setTitle("Add Cart £\(movieViewModel.moviePrice)", for: .normal)
        }
    }

}

