//
//  PlacesManager.swift
//  Landmarks
//
//  Created by Eric Broussard on 4/26/23.
//
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI
import FirebaseStorage

let PLACES_REF = Firestore.firestore().collection("Places")

class PlacesManager {
    static let shared = PlacesManager()
    
    
    func loadPlaces() async throws -> [LandmarkFB]{
        let docs =  try await PLACES_REF.getDocuments().documents
        return docs.compactMap { doc -> LandmarkFB? in
            return try? doc.data(as: LandmarkFB.self)
        }
    }
    
    func makePlace(_ landmark: LandmarkFB, image: UIImage) async throws {
        let newDoc =  PLACES_REF.document()
        let imageUrl = try await getImageURL(image, id: newDoc.documentID)
        let newLandmark = LandmarkFB(id: newDoc.documentID, name: landmark.name, park: landmark.park, state: landmark.state, description: landmark.description, isFavorite: landmark.isFavorite, isFeatured: landmark.isFeatured, imageURL: imageUrl, category: landmark.category, coordinates: landmark.coordinates)
        try PLACES_REF.document(newDoc.documentID).setData(from: newLandmark)
    }
    
    
    func getImageURL(_ image: UIImage, id: String) async throws -> String {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return ""}
        let storageRef = Storage.storage().reference().child("PlacesImages").child(id)
        let res = try await storageRef.putDataAsync(imageData)
        let url = try await storageRef.downloadURL()
        return url.absoluteString
    }
}

