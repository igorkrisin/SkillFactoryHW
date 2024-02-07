//
//  ViewController.swift
//  emodji
//
//  Created by Игорь Крысин on 26.12.2023.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldForEmoji: UITextField!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
            view.addGestureRecognizer(tap)
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "emodji" else { return }
            guard let destination = segue.destination as? SecondViewController else { return }
        destination.emodji = textFieldForEmoji.text ?? "❌"
      }
    
    @objc func dismissKeyboard() {
         view.endEditing(true)
       }
    
    @IBAction func pushSecondVC(_ sender: Any) {
        let destination = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        destination.emodji = textFieldForEmoji.text ?? "❌"
        navigationController?.pushViewController(destination, animated: true)
    }

}

