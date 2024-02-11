//
//  Extensions.swift
//  TodoMVC
//
//  Created by Игорь Крысин on 11.02.2024.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Возвращаем количество строк в секции
        print("count: ",itemModel.storeItems.count)
        return itemModel.storeItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Создаем ячейку и настраиваем ее содержимое
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ItemCell
        
        //delegate for cell
        cell.delegate = self
        // Например, устанавливаем текст для titleLabel
        cell.titleLabel.text = itemModel.storeItems[indexPath.row].name
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ItemCell
        cell.backgroundColor = UIColor.systemPink
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.itemModel.deleteItem(index: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
