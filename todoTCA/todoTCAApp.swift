//
//  todoTCAApp.swift
//  todoTCA
//
//  Created by Kohei Oyama on 2023/01/21.
//

import SwiftUI

@main
struct todoTCAApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
