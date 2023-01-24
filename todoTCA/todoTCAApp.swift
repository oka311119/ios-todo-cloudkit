import SwiftUI
import ComposableArchitecture

@main
struct todoTCAApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListView(
                store: Store(
                    initialState: ListCore.State(),
                    reducer: ListCore()
                )
            )
        }
    }
}

