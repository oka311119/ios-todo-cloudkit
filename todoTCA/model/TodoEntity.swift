import Foundation

struct TodoEntity: IEntity {
    let id = UUID()
    let title: String
}

extension TodoEntity {
    static let mock = [
        TodoEntity(title: "title1"),
        TodoEntity(title: "title2"),
        TodoEntity(title: "title3"),
        TodoEntity(title: "title4"),
        TodoEntity(title: "title5")
    ]
}
