import Foundation
import ComposableArchitecture

struct TodoClient {
    var fetch: () async -> [Todo]
}

extension TodoClient: DependencyKey {
    static let liveValue = Self(
        fetch: {
            return Todo.mock
        }
    )
}

extension DependencyValues {
    var todoClient: TodoClient {
        get { self[TodoClient.self] }
        set { self[TodoClient.self] = newValue }
    }
}
