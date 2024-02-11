protocol MyDelegate: AnyObject {
    func addToDO(item: Item)
}

import UIKit

class AddViewController: UIViewController {
    
    weak var nameDelegate: MyDelegate?
    
    lazy var textfield: UITextField = {
        let fieldForName = UITextField()
        fieldForName.borderStyle = .roundedRect
        fieldForName.placeholder = "Add TODO"
        fieldForName.translatesAutoresizingMaskIntoConstraints = false
        fieldForName.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        return fieldForName
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(primaryAction: saveToDO)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 3
        btn.setTitle("Save", for: .normal)
        btn.tintColor = .white
        
        btn.backgroundColor = .gray
       
        return btn
    }()
    
    lazy var saveToDO = UIAction { _ in
        let vc = ViewController()
        let item = Item(name: self.textfield.text ?? "")
        print(item.name)
        self.nameDelegate?.addToDO(item: item)
        self.navigationController?.popViewController(animated: true)
    }
    
    var myView  = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textfield)
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
        
        
        
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: textfield.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
        
    
    }
}

