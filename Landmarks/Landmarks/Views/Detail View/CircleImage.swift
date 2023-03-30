//
//  CircleImage.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/16/23.
//

import SwiftUI

//An circular image of the landmark for the detail view.
struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius:7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
