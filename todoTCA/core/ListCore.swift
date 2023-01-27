import Foundation
import ComposableArchitecture

struct ListCore: ReducerProtocol {
	struct State: Equatable {
        var todos: [TodoEntity] = []
        var edit: TodoEntity?
    }

    enum Action: Equatable {
        case fetch
        case fetchDataResponse(TaskResult<[TodoEntity]>)
        case transition(UUID)
        case addButtonTapped
    }

    @Dependency(\.todoClient) var todoClient

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .fetch:
            return .task {
                await .fetchDataResponse(
                    TaskResult {
                        await todoClient.fetch()
                    }
                )
            }
        case .fetchDataResponse(.success(let todos)):
            state.todos = todos
            return .none
            
        case .fetchDataResponse(.failure(let error)):
            print(error)
            return .none

        case .transition(let id):
            guard let todo = state.todos.first(where: { $0.id == id }) else { return .none }
            state.edit = todo
            return .none
            
        case .addButtonTapped:
            print("add button tapped!")
            todoClient.create()
            return Effect(value: .fetch)
        }
    }
}

