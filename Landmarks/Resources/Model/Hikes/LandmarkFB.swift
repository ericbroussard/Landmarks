//
//  LandmarkFB.swift
//  Landmarks
//
//  Created by Eric Broussard on 5/28/23.
//

import Foundation
import SwiftUI
import CoreLocation
import FirebaseFirestore

struct LandmarkFB: Hashable, Codable, Identifiable {
    var id: String? = UUID().uuidString
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var imageURL: String
    var category: String
    var coordinates: GeoPoint
}
