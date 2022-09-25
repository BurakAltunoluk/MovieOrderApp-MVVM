//
//  ViewController.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 21/09/2022.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    private var choosedRowNumber = 0
    private var movieListViewModel: MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromApi()
    }
    
    func getDataFromApi () {
        let url = URL(string: "https://raw.githubusercontent.com/BurakAltunoluk/APIs-Sample/main/MoviesAPI.json")!
        
        WebService().getData(url: url) { data in
            if let data = data {
                self.movieListViewModel = MovieListViewModel(movieDataList: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choosedRowNumber = indexPath.row

        performSegue(withIdentifier: "showDetails", sender: nil)
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListViewModel == nil ? 0 : self.movieListViewModel.rowNumberSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! MoviesTableViewCell
        
        let movieViewModel = self.movieListViewModel.movieAtIndex(indexPath.row)
        
        DispatchQueue.main.async {
            
            let imageData = try! Data(contentsOf:URL(string: movieViewModel.movieImageUrl)!)
            cell.movieImage.image = UIImage(data: imageData)
            
            cell.titleLabel.text = movieViewModel.movieName
            cell.detailsLabel.text = movieViewModel.movieDetail
            
            
        }
        
        return cell
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.movieListViewModel1 = self.movieListViewModel
            destinationVC.rowNumber = choosedRowNumber
            
        }
    }
    
}
