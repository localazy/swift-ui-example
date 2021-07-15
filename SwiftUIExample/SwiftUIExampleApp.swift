//
//  SwiftUIExampleApp.swift
//  SwiftUIExample
//
//  Created by Jan Bilek on 13.07.2021.
//

import SwiftUI
import Localazy_iOS

@main
struct SwiftUIExampleApp: App {
    init() {
        Bundle.swizzleLocalizationWithLocalazy()
        Localazy.shared.forceReload()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
