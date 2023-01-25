import ComposableArchitecture

struct EditCore: ReducerProtocol {
    struct State: Equatable {
        var title: String = ""
    }

    enum Action: Equatable {
        case titleChanged
        case submit
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action>{
        switch action {
        case .titleChanged:
            return .none
        case .submit:
            return .none
        }
    }
}

