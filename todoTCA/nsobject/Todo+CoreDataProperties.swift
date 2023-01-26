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

    func convertedToEntity() -> TodoEntity? {
        TodoEntity.init?(title: title)
    }
}

extension Todo : Identifiable {

}
