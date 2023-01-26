import Foundation

struct TodoEntity: Identifiable, Equatable {
    let id = UUID()
    let title: String
    
    init?(title: String?) {
        if title == nil {
            return nil
        }
    }
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
