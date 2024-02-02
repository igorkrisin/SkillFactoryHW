//
//  WorkNameCell.swift
//  myTestDelegate
//
//  Created by Игорь Крысин on 28.01.2024.
//

import UIKit

class WorkTimerCell: UITableViewCell {
    
    var buttonTappedHandler: (() -> Void)?

    @IBOutlet weak var nameWork: UILabel!
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var saveToDo: UIButton!
    
    
    var name: String = ""
    
    
    var hours = 0
    var minutes = 0
    var seconds = 0
    var counter = 0
    var timer = Timer()

    
    let stopImage = UIImage(named: "pause")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    let playImage = UIImage(named: "play")
    
   
    
   
    
    var totalTime = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameWork.text = name
        // Initialization code
       
    }
    
    @IBAction func toSettingView(_ sender: Any) {
        buttonTappedHandler?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

    
    func setNameWork(name: String){
        self.nameWork.text = name
    }
    

    
    
    @IBAction func startTimer(_ sender: Any) {
        if counter == 0{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
            counter = 1
            StartButton.setImage(stopImage, for: .normal)
            
        } else {
            timer.invalidate()
            counter = 0
            StartButton.setImage(playImage, for: .normal)
            
        }
    }
    
    
    
    @IBAction func recordToDOTimer(_ sender: Any) {
        
        
    }
    
    
    @objc fileprivate func count() {
            seconds += 1
           
            if seconds == 59 {
                minutes += 1
                seconds = 0
            }
            
            if minutes == 59 {
                hours += 1
                minutes = 0
                seconds = 0
            }
            
            if hours == 24 {
                timer.invalidate()
            }
            
            
            secondLabel.text =  seconds < 10 ? "0\(seconds)" : "\(seconds)"
            minuteLabel.text =  minutes < 10 ? "0\(minutes)" : "\(minutes)"
            hourLabel.text =  hours < 10 ? "0\(hours)" : "\(hours)"
            
        
        
    }
    
    
    
    
    
}
