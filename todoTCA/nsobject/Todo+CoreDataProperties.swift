//
//  Todo+CoreDataProperties.swift
//  todoTCA
//
//  Created by koyama on 2023/01/26.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String?
    @NSManaged public var note: String?
}

extension Todo : Identifiable {

}

extension Todo: Mappable {
    func convertedToEntity() -> TodoEntity? {
        guard let title = title else {
            assertionFailure()
            return nil
        }
        return TodoEntity(title: title)
    }
}
