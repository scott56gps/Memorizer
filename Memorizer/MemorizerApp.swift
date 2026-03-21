//
//  ScriptureMemorizerApp.swift
//  ScriptureMemorizer
//
//  Created by Scott Nicholes on 3/16/26.
//

import SwiftUI

@main
struct ScriptureMemorizerApp: App {
    @StateObject private var router = Router()
    
    var body: some Scene {
        WindowGroup {
            AppViewBuilder.build(
                screen: router.currentView,
                router: router.navigators)
        }
    }
}
