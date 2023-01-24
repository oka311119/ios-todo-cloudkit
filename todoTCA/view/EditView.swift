import SwiftUI
import ComposableArchitecture

struct EditView: View {
    let store: StoreOf<EditCore>

    var body: some View {
        WithViewStore(self.store) { viewStore in 
            Text(viewStore.title)
            Button("submit") {
                viewStore.send(.submit)
            }
        }
    }
}
