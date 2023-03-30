//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/16/23.
//

import SwiftUI

//This is the list page.
struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    //This profile code is copied from the CategoryHome page.
    //TODO can it be put in ContentView to be more at a top level?
    @State private var showingProfile = false
    //This stores the toggle value for whether the list should filter by favorites or not.
    @State private var showFavoritesOnly = false
    
    //If the landmark's data marks it as a favorite and the list should be filtered, the filteredLandmarks array filters it.
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) {
                    landmark in
                    //clicking any landmark row leads to a detail page.
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .accessibilityAction(named: landmark.isFavorite ? "Unfavorite" : "Mark Favorite") {
                        if let index = modelData.landmarks.firstIndex(where: { $0.id == landmark.id }) {
                            modelData.landmarks[index].isFavorite.toggle()
                        }
                    }
                }
            }
            .navigationTitle("Landmarks")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
