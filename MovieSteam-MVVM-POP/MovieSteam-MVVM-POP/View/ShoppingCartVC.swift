//
//  ShoppingCartVC.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 25/09/2022.
//

import UIKit

final class ShoppingCartVC: UIViewController {
     
    @IBOutlet private var payButtonOutlet: UIButton!
    @IBOutlet private var totalLabel: UILabel!
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if temporaryData.addedToBasket.count > 0  {
            payButtonOutlet.isEnabled = true
            self.tabBarItem.badgeValue = String(temporaryData.addedToBasket.count)}
        totalLabel.text =  "Total: £\(String(format: "%.02f",temporaryData.totalPayment()))"
        tableView.reloadData()
    }
    
    @IBAction private func payButtonPressed(_ sender: UIButton) {
        temporaryData.addedToBasket.removeAll()
        self.tableView.reloadData()
        self.tabBarItem.badgeValue = nil
        totalLabel.text =  "Total: £\(String(format: "%.02f",temporaryData.totalPayment()))"
        payButtonOutlet.isEnabled = false
        alertMenu()
        
    }
    
    private func alertMenu() {
        let alert = UIAlertController(title: "Payment Sussecfull", message: "Thank you for your purchase", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }

}

extension ShoppingCartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temporaryData.addedToBasket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.movieNameLabel.text = "- \(temporaryData.movieAtIndex(indexPath.row).movieName)"
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
