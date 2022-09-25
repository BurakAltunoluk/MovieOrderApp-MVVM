//
//  CartTableViewCell.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 25/09/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet var moviePriceLabel: UILabel!
    @IBOutlet var movieNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
