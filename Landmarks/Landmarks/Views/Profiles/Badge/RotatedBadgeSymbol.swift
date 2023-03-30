//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/17/23.
//

import SwiftUI

//Draws a rotated version of the mountain symbol for the badge.
struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
