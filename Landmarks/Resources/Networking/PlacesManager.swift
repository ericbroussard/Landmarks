//
//  PlacesManager.swift
//  Landmarks
//
//  Created by Eric Broussard on 4/26/23.
//

import Firebase
import FirebaseFirestore

static let PLACES_REF = Firestore.firestore().collection("Places") PLACES_REF.getDocument()

class PlacesManager {
    static let shared = PlacesManager()
    
    
    func  loadPlaces() -> [Landmark]{
        
    }
}
