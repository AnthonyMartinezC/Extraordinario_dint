//
//  Examen_DintApp.swift
//  Examen_Dint
//
//  Created by Anthony Leonidas Martinez Campoverde on 24/6/25.
//

import SwiftUI

@main
struct Examen_DintApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
