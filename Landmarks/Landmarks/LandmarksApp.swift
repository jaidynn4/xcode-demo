//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/16/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
