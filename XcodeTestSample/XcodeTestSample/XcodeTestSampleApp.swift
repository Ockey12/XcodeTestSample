//
//  XcodeTestSampleApp.swift
//  XcodeTestSample
//
//  Created by オナガ・ハルキ on 2023/12/21.
//

import SwiftUI

@main
struct XcodeTestSampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
