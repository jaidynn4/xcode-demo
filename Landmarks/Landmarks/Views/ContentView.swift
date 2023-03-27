//
//  ContentView.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
