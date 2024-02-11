

import UIKit

class ViewController: UIViewController {
    
    var myTableView = UITableView()
    var moveToSvcButton = UIButton()
    
    let itemModel = Model()
    
    var alert = UIAlertController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableView.reloadData()
    }
    override func viewDidLoad() {
        
        self.title = "Todo"
        
        myTableView = createTableView(myTableView)
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add,
                                                            primaryAction: UIAction(handler: { _ in
            let addVC = AddViewController()
            addVC.nameDelegate = self
            self.navigationController?.pushViewController(addVC, animated: true)
        })
        )
        
        myTableView.reloadData()
    }
    
    
    func createTableView(_ table: UITableView) -> UITableView {
        
        table.frame = view.bounds
        table.dataSource = self
        table.delegate  = self
        
        // Регистрируем класс MyTableViewCell для использования в таблице
        table.register(ItemCell.self, forCellReuseIdentifier: "MyCell")
        table.allowsMultipleSelection = true
        view.addSubview(myTableView)
        //Создаем констрэйнты для my table view
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        print("height: ", table.frame.size.height)
        
        return table
    }
    
    
    @objc func moveToAddVC(sender: Any) {
        let addVC = AddViewController()
        self.navigationController?.pushViewController(addVC, animated: true)
        
    }
    
    func editCellcontent(indexPath: IndexPath) {
        let cell = tableView(myTableView, cellForRowAt: indexPath) as! ItemCell
        
        alert = UIAlertController(title: "edit your task", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), for: .editingChanged)
            textField.text = cell.textLabel?.text
            
        })
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let editAlertAction = UIAlertAction(title: "Submit", style: .default) { (createAlert) in
            
            guard let textFields = self.alert.textFields, textFields.count > 0 else{
                return
            }
            
            guard let textValue = self.alert.textFields?[0].text else {
                return
            }
            
            self.itemModel.changeName(textValue, index: indexPath.row)
            
            self.myTableView.reloadData()
        }
        alert.addAction(cancelAlertAction)
        alert.addAction(editAlertAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    @objc func alertTextFieldDidChange(_ sender: UITextField) {
        guard let senderText = sender.text, alert.actions.indices.contains(1) else { return }
        let action = alert.actions[1]
        action.isEnabled = senderText.count > 0
    }
}


extension ViewController: MyDelegate, CellDelegate {
    func editCell(cell: ItemCell) {
        guard let indexPatx = myTableView.indexPath(for: cell) else { return }
        
        self.editCellcontent(indexPath: indexPatx)
    }
    
    
    func addToDO(item: Item) {
        itemModel.storeItems.append(item)
        print(itemModel.storeItems)
    }
    
    
    
}

