import ComposableArchitecture

struct EditCore: ReducerProtocol {
    struct State: Equtable {
        var title: String = ""
    }

    struct Action: Equtable {
        case titleChanged
        case submit
    }

    func reduce(into state inout State, action: Action) -> EffectTask<Action>{
        switch action {
        case .titleChanged:
            return .none
        case .submit:
            return .none
        }
    }
}

