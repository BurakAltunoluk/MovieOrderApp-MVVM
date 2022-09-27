//
//  ShoppingCartVC.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 25/09/2022.
//

import UIKit

class ShoppingCartVC: UIViewController {
     
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if temporaryData.addedToBasket.count > 0  {
            self.tabBarItem.badgeValue = String(temporaryData.addedToBasket.count)}
        totalLabel.text =  "Total: £\(String(format: "%.01f",temporaryData.totalPayment()))"
        
       
      
        tableView.reloadData()
    }
    
    @IBAction func payButtonPressed(_ sender: UIButton) {
    
        
    }

}

extension ShoppingCartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temporaryData.addedToBasket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell

        cell.movieNameLabel.text = temporaryData.movieAtIndex(indexPath.row).movieName
        cell.moviePriceLabel.text = temporaryData.movieAtIndex(indexPath.row).MoviePrice
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let newTotal = temporaryData.deleteMovie(indexPath.row)
            totalLabel.text =  "Total: £\(String(format: "%.01f",newTotal))"
             NotificationCenter.default.post(name: Notification.Name("delete"), object: nil)
             dismiss(animated: true)
            tableView.reloadData()
            
        }
    }
    
    
    
}
