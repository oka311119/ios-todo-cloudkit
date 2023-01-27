import Foundation
import ComposableArchitecture

struct TodoClient {
    var fetch: () async -> [TodoEntity]
    var create: () -> Void
}

extension TodoClient: DependencyKey {
    static let liveValue = Self(
        fetch: {
            return TodoDataAccesser().fetch()
        },
        create: {
            TodoDataAccesser().create()
        }
    )
    
    static let testValue = Self(
        fetch: {
            return TodoEntity.mock
        },
        create: {
            return
        }
    )
}

extension DependencyValues {
    var todoClient: TodoClient {
        get { self[TodoClient.self] }
        set { self[TodoClient.self] = newValue }
    }
}
