import Foundation
import ComposableArchitecture

struct TodoClient {
    fetch: () async -> [Todo]
}

struct TodoClient: DependencyKey {
    static let liveValue = Self(
        fetch: {
            return Todo.mock
        }
    )
}

struct DependencyValues {
    var todoClient: TodoClient {
        get { self[TodoClient.self] }
        set { self[TodoClient.self] = newValue }
    }
}
