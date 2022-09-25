//
//  ShoppingCartVC.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 25/09/2022.
//

import UIKit

class ShoppingCartVC: UIViewController {
    
    var listOfCart: ShoppingCartViewModel!
    
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        listOfCart = ShoppingCartViewModel(addedToBasket: [])

        listOfCart.addNew(name: "abdi", price: "34.34")
        listOfCart.addNew(name: "Vehbi", price: "12.88")
        tableView.reloadData()
        totalLabel.text = "Total: £\(listOfCart.totalPayment())"
    }



}

extension ShoppingCartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfCart == nil ? 0 : listOfCart.rowNumberOfSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        cell.movieNameLabel.text = listOfCart.movieAtIndex(indexPath.row).movieName
        cell.moviePriceLabel.text = listOfCart.movieAtIndex(indexPath.row).MoviePrice
        return cell
    }
    
    
    
    
    
}
