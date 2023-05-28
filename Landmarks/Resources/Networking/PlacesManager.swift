//
//  PlacesManager.swift
//  Landmarks
//
//  Created by Eric Broussard on 4/26/23.
//
import FirebaseFirestore
import FirebaseFirestoreSwift

let PLACES_REF = Firestore.firestore().collection("Places")

class PlacesManager {
    static let shared = PlacesManager()
    
    
    func loadPlaces() async throws -> [LandmarkFB]{
        let docs =  try await PLACES_REF.getDocuments().documents
        return docs.compactMap { doc -> LandmarkFB? in
            return try? doc.data(as: LandmarkFB.self)
        }
    }
    
    func makePlace(_ landmark: LandmarkFB) throws {
        let newDoc =  PLACES_REF.document()
        let newLandmark = LandmarkFB(id: newDoc.documentID, name: landmark.name, park: landmark.park, state: landmark.state, description: landmark.description, isFavorite: landmark.isFavorite, isFeatured: landmark.isFeatured, imageURL: landmark.imageURL, category: landmark.category, coordinates: landmark.coordinates)
        try PLACES_REF.document(newDoc.documentID).setData(from: newLandmark)
    }
}

