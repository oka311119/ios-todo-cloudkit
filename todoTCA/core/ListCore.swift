import ComposableArchitecture

struct ListCore: ReducerProtocol {
	struct State: Equatable {
        var todos: [TodoEntity] = []
        var edit: TodoEntity?
    }

    enum Action: Equatable {
        case fetch
        case fetchDataResponse(TaskResult<[TodoEntity]>)
        case translate(TodoEntity)
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

        case .translate(let todo):
            state.edit = todo
            return .none
        }
    }
}

