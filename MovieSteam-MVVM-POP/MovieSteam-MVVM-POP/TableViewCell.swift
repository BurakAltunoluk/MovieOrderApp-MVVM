//
//  TableViewCell.swift
//  MovieSteam-MVVM-POP
//
//  Created by Burak Altunoluk on 22/09/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var detailsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
