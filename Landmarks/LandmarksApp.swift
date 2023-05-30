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
    }
    
    func signIn() async throws{
        try await Auth.auth().signIn(withEmail: "test@test.com", password: "test123")
    }
}
