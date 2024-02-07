//
//  UniversalCell.swift
//  TableView
//
//  Created by Игорь Крысин on 03.01.2024.
//

import UIKit

class UniversalCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
