//
//  PageView.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/29/23.
//

import SwiftUI

//This View contains a PageViewController and a PageControl
struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(
                pages: pages,
                currentPage: $currentPage
            )
            //Pass the number of pages and the index binding to the control so that it displays correctly
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(
            pages: ModelData().features.map {
                FeatureCard(landmark: $0)
                
            }
        )
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}
