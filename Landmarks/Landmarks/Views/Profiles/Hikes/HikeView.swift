/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

//Creates a dropdown that expands to show the graph of the hike.
//TODO make the whole row clickable instead of just the button.
struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                
                Button {
                    showDetail.toggle()
                } label: {
                    HStack{
                        
                        HikeGraph(hike: hike, path: \.elevation)
                            .frame(width: 50, height: 30)

                        VStack(alignment: .leading) {
                            Text(hike.name)
                                .font(.headline)
                            Text(hike.distanceText)
                        }

                        Spacer()
                        
                        Label("Graph", systemImage: "chevron.right.circle")
                            .labelStyle(.iconOnly)
                            .imageScale(.large)
                            .rotationEffect(.degrees(showDetail ? 90 : 0))
                            .padding()
                        
                    }
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
