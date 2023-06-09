//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/16/23.
//

import SwiftUI

//A single row in the list view.
struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            //Only shows a star if the landmark is favorited.
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .accessibilityValue("Favorited")
                    .accessibilitySortPriority(1)
            }
        }
        .accessibilityElement(children: .combine)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group{
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
