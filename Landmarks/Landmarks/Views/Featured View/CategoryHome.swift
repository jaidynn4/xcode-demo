//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/29/23.
//

import SwiftUI

//This is the featured page in the app.
struct CategoryHome: View {
    //TODO what is an environment object
    @EnvironmentObject var modelData: ModelData
    //This stores whether the profile modal presentation is displayed.
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView{
            List {
                //TODO this uses UI Kit to make a slidingrow.
                PageView(
                    pages: modelData.features.map { FeatureCard(landmark: $0) }
                )
                .aspectRatio(3 / 2, contentMode: .fit)
                .listRowInsets(EdgeInsets())
                
                //This generates each category row with its content
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            //This generates the icon for the profile page
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            //This creates a modal presentation of the profile page
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
