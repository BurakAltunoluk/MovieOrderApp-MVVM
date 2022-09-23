//
//  DetailsVC.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 23/09/2022.
//

import UIKit

class DetailsVC: UIViewController {

    var movieListViewModel1: MovieListViewModel!
    var rowNumber = 0
  
    @IBOutlet var movieDetails: UITextView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var movieImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func addToCartPressed(_ sender: UIButton) {
        
    }

    private func setup() {
        
        if movieListViewModel1 != nil {
            let movieViewModel = self.movieListViewModel1.movieAtIndex(rowNumber)
            movieTitle.text = movieViewModel.movieName
            let imageData = try? Data(contentsOf:URL(string:movieViewModel.movieImageUrl)!)
            movieImage.image = UIImage(data: imageData!)
            movieDetails.text = movieViewModel.movieDetail
            
            
        }
        
    }
}
