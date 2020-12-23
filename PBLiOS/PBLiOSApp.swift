//
//  PBLiOSApp.swift
//  PBLiOS
//
//  Created by John Bethancourt on 12/22/20.
//

import SwiftUI

@main
struct PBLiOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
