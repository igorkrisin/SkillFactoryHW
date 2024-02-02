//
//  CoreManager.swift
//  myTestDelegate
//
//  Created by Игорь Крысин on 01.02.2024.
//

import Foundation
import CoreData

class CoreManager {
    static let shared = CoreManager()
    var toDos = [Todo]()
    
    
    private init() {
        fetchAllTodo()
    }
    
    
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "myTestDelegate")

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in

            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")

            }

        })

        return container

    }()

     

    // MARK: - Core Data Saving support

    func saveContext () {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
                
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                
            }
            
        }
    }
    
    func fetchAllTodo() {
        let req = Todo.fetchRequest()
        if let toDos = try? persistentContainer.viewContext.fetch(req) {
            self.toDos = toDos
        }
    }
    
    func addNewTodo(name: String, hourses: String, minutes: String, seconds: String) {
        let todo = Todo(context: persistentContainer.viewContext)
        todo.id = UUID().uuidString
        todo.name = name
        todo.hourses = hourses
        todo.minutes = minutes
        todo.seconds = seconds
        
        saveContext()
        fetchAllTodo()
                        
    }
}
