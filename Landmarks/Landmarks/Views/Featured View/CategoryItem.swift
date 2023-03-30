//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/29/23.
//

import SwiftUI

//This is a single landmark item for the preview page.
//TODO test to see if it is accessible for VoiceOver.
struct CategoryItem: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
