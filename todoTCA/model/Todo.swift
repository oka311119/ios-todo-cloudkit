import Foundation

struct Todo: Identifiable, Equatable {
    let id = UUID()
    let title: String
}

extension Todo {
    static let mock = [
        Todo(title: "title1"),
        Todo(title: "title2"),
        Todo(title: "title3"),
        Todo(title: "title4"),
        Todo(title: "title5")
    ]
}

