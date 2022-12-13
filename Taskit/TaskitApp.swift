//
//  TaskitApp.swift
//  Taskit
//
//  Created by Caleb Barranco on 12/12/22.
//

import SwiftUI

@main
struct TaskitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
