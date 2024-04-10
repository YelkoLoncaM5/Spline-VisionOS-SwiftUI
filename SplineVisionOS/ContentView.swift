//
//  ContentView.swift
//  SplineVisionOS
//
//  Created by Yelko Andrej Loncarich Manrique on 7/04/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import SplineRuntime

struct ContentView: View {
    
    @State private var isShowingVolume = false
    @State private var isShowingImmersiveSpace = false
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismiss) private var dismissWindow
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            CharacterView()
            HStack {
                Toggle("Show Volume", isOn: $isShowingVolume)
                    .toggleStyle(.button)
                    .onChange(of: isShowingVolume) { _, isShowing in
                        if isShowing {
                            openWindow(id: "volume")
                        } else {
                            dismissWindow()
                        }
                    }
                Toggle("Show Immersive Space", isOn: $isShowingImmersiveSpace)
                    .toggleStyle(.button)
                    .onChange(of: isShowingImmersiveSpace) { _, isShowing in
                        Task {
                            if isShowing {
                                await openImmersiveSpace(id: "immersiveSpace")
                            } else {
                                await dismissImmersiveSpace()
                            }
                        }
                    }
            }.padding()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

struct CharacterView: View {
    var body: some View {
        let url = URL(string: "https://build.spline.design/RZWov07X7gObHXzOdqe0/scene.splineswift")!
        try? SplineView(sceneFileURL: url).ignoresSafeArea(.all)
    }
}

struct VolumenView: View {
    var body: some View {
        let url = URL(string: "https://build.spline.design/reFVcw32mhXvy5nduMyp/scene.splineswift")!
        SplineVolumetricContent(sceneFileURL: url)
    }
}

struct ImmersiveView: ImmersiveSpaceContent {
    var body: some ImmersiveSpaceContent {
        let url = URL(string: "https://build.spline.design/stjKgwxBNb8nE1XLgMDM/scene.splineswift")!
        SplineImmersiveSpaceContent(sceneFileURL: url)
    }
}
