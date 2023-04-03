//
//  Landmark.swift
//  Landmarks
//
//  Created by Fohr, Jaidynn R on 3/16/23.
//

import Foundation
import SwiftUI
import CoreLocation

//Landmark object to store model information
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    //Specify the category for the featured page
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    //Get the landmark image
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    //Get the larger featured image from resources if it exists
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    //Get map coordinates
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    //Struct used for map coordinates
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
