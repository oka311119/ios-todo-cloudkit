import Foundation
import ComposableArchitecture

struct TodoClient {
    var fetch: () async -> [TodoEntity]
}

extension TodoClient: DependencyKey {
    static let liveValue = Self(
        fetch: {
            return TodoEntity.mock
        }
    )
    
    static let testValue = Self(
        fetch: {
            return TodoEntity.mock
        }
    )
}

extension DependencyValues {
    var todoClient: TodoClient {
        get { self[TodoClient.self] }
        set { self[TodoClient.self] = newValue }
    }
}

protocol Repository {
    func fetchData() -> [Data]
    func saveData(_ data: Data)
    func deleteData(_ data: Data)
}

class Synchronizer {
    func sync() {
        // check for changes in CloudKit and update local Core Data store
        // check for changes in Core Data store and update remote CloudKit database
    }
}
