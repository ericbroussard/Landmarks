//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Eric Broussard on 4/25/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    @State private var showingPost = false
    
    var body: some View {
        NavigationView{
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                
                ForEach(modelData.categories.keys.sorted(), id: \.self)
                { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
                .listStyle(.inset)
                .navigationTitle("Featured")
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle" )
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environmentObject(modelData)
                }
                .toolbar {
                    Button {
                        showingPost.toggle()
                    } label: {
                        Label("User Profile", systemImage: "plus" )
                    }
                }
                .sheet(isPresented: $showingPost) {
                    PlacePosting(text: "", text2: "", text3: "")
                }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
