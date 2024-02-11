//
//  Model.swift
//  TodoMVC
//
//  Created by Игорь Крысин on 07.02.2024.
//

import Foundation


class Item {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Model {
    
    var storeItems: [Item] = [
        Item(name: "bye"),
        Item(name: "hello"),
        Item(name: "My")
    ]
    
    func addItem(_ name: String) {
        self.storeItems.append(Item(name: name))
    }
    
    func changeName(_ newName: String, index: Int) {
        self.storeItems[index].name = newName
    }
    func deleteItem(index: Int) {
        self.storeItems.remove(at: index)
    }
    
}
