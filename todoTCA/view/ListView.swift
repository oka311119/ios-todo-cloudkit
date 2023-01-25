import SwiftUI
import ComposableArchitecture

struct ListView: View {
    let store: StoreOf<ListCore>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            List(viewStore.todos) { todo in
                Text(todo.title)
            }
            .onAppear {
                viewStore.send(.fetch)
            }
        }
    }
}

