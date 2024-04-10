//
//  SplineVisionOSApp.swift
//  SplineVisionOS
//
//  Created by Yelko Andrej Loncarich Manrique on 7/04/24.
//

import SwiftUI

@main
struct SplineVisionOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        WindowGroup(id: "volume") {
            VolumenView()
        }
        .windowStyle(.volumetric)
        .defaultSize(
            width: 0.3,
            height: 0.3, 
            depth: 0.3,
            in: .meters
        )
        ImmersiveSpace(id: "immersiveSpace") {
            ImmersiveView()
        }
        .immersionStyle(selection: .constant(.full))
    }
}
