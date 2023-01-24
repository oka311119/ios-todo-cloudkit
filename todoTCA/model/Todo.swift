import Foundation

struct Todo: Identifiable, Equtable {
    let title: String
}

extension Todo {
    static let mock = [
        mock(title: "title1"),
        mock(title: "title2"),
        mock(title: "title3"),
        mock(title: "title4"),
        mock(title: "title5")
    ]
}

