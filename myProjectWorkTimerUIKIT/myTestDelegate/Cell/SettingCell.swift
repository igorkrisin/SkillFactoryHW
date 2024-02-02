//
//  SettingCell.swift
//  myTestDelegate
//
//  Created by Игорь Крысин on 28.01.2024.
//

import UIKit

class SettingCell: UITableViewCell {

    
    
    @IBOutlet weak var nameToDo: UILabel!
    
    @IBOutlet weak var timerHours: UILabel!
    @IBOutlet weak var timerMinutes: UILabel!
    @IBOutlet weak var timerSeconds: UILabel!
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
