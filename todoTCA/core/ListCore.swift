import ComposableArchitecture

struct ListCore: ReducerProtocol {
	struct State: Equtable {
        var todos: [Todo] = []
        var edit: Todo?
    }

    enum Action: Equtable {
        case fetch
        case translate(Todo)
    }

    @Dependency(.\todoClient) var todoClient

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .fetch:
            state.todos = await todoClient.fetch()
            return .none

        case .translate(let todo):
            state.edit = todo
            return .none
        }
    }
}

