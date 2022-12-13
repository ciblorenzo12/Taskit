//
//  TaskitApp.swift
//  Taskit
//
//  Created by Caleb Barranco on 12/12/22.
//

import SwiftUI
import Firebase
@main
struct TaskitApp: App {
    let persistenceController = PersistenceController.shared
    init (){
        FirebaseApp.configure()
        return 
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
