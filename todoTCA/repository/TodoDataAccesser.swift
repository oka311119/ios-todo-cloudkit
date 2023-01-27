import Foundation

struct TodoDataAccesser {
    let todoService = TodoService()
    
    func fetch() -> [TodoEntity] {
        return todoService.fetch().compactMap { $0.convertedToEntity() }
    }
    
    func create() {
        return todoService.create()
    }
}


import CoreData

class TodoService {
    let container: NSPersistentCloudKitContainer
    let context: NSManagedObjectContext

    init() {
        self.container = PersistenceController.shared.container
        self.context = container.viewContext
    }

    func fetch() -> [Todo] {
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        do {
            let todos = try context.fetch(request)
            return todos
        } catch {
            print("Error fetching TodoEntity: \(error)")
            return []
        }
    }
    
    func create() {
        if let todo = NSEntityDescription.insertNewObject(forEntityName: "Todo", into: context) as? Todo {
            todo.title = "😭sample"
        }
        save()
    }
    
    private func save() {
        do {
            try context.save()
        } catch {
            return
        }
    }
}

