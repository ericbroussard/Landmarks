//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Eric Broussard on 4/25/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    init() {
        startFireBase()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
    
    func startFireBase() {
        FirebaseApp.configure()
        Task{
            try? PlacesManager().makePlace(LandmarkFB(id: "69", name: "doghouse", park: "dogpark", state: "dogstate", description: "alldogsallowed", isFavorite: true, isFeatured: true, imageURL: "", category: "dogcategory", coordinates: GeoPoint(latitude: 39, longitude: 24)))
        }
    }
    
    func signIn() async throws{
        try await Auth.auth().signIn(withEmail: "test@test.com", password: "test123")
    }
}
