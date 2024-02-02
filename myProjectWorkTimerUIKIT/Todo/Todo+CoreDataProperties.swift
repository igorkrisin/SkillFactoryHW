//
//  Todo+CoreDataProperties.swift
//  myTestDelegate
//
//  Created by Игорь Крысин on 01.02.2024.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var hourses: String?
    @NSManaged public var minutes: String?
    @NSManaged public var seconds: String?

}

extension Todo : Identifiable {
    func updateTodo(newName: String) {
        self.name = newName
        
        try? managedObjectContext?.save()
    }
    
    func deleteTodo(){
        managedObjectContext?.delete(self)
        try? managedObjectContext?.save()
    }
}
