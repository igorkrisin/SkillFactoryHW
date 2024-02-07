//
//  MyViewController.swift
//  TableView
//
//  Created by Игорь Крысин on 01.01.2024.
//

import UIKit

class MyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let userArratray = ["Евгений", "Николай", "Катерина", "Станислав", "Артур", "Марина", "Вячеслав", "Петра"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArratray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(1)
        tableView.register(UINib(nibName: "UniversalCell", bundle: nil), forCellReuseIdentifier: "UniversalCell")

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversalCell", for: indexPath) as? UniversalCell else { return UITableViewCell() }
        cell.userName.text = userArratray[indexPath.row]
        return cell
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
