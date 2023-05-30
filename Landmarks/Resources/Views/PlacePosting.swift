//
//  PlacePosting.swift
//  Landmarks
//
//  Created by Eric Broussard on 5/30/23.
//

import SwiftUI
import CoreLocation
import FirebaseFirestore

struct PlacePosting: View {
    @State var image = UIImage()
    @State private var showSheet = false
    @State var text: String
    @State var text2: String
    @State var text3: String
    @State var selection = "Mountains"
       let category = ["Mountains", "Lakes", "Rivers"]

    var body: some View {
        VStack {
            Image(uiImage: self.image)
                    .resizable()
                    .cornerRadius(50)
                    .padding(.all, 4)
                    .frame(width: 100, height: 100)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .padding(8)
                    .onTapGesture {
                        showSheet = true
                    }
            
            VStack {
                TextField("Title", text: $text)
                TextField("Description", text: $text2)
                TextField("Address", text: $text3)
                Picker("Select a paint color", selection: $selection) {
                    ForEach(category, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.menu)
                Button("Submit") {
                    submit()
                }
            } .padding(.leading, 20)
                .sheet(isPresented: $showSheet) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
        }
    }
}

struct PlacePosting_Previews: PreviewProvider {
    static var previews: some View {
        PlacePosting(text: "", text2: "", text3: "")
    }
}
extension PlacePosting{
    func submit() {
        let geoCoder = CLGeocoder()
        var coordinates =  CLLocationCoordinate2D()
        var state = ""
        var city = ""
        geoCoder.geocodeAddressString(text3) { (placemarks, error) in
            guard
                let placemark = placemarks?.first,
                let location = placemark.location
            else {
                return
            }
            state = placemark.administrativeArea ?? "NA"
            city = placemark.locality ?? "Na"
            coordinates = location.coordinate
        }
        
        let landmark = LandmarkFB(name: text, park: city, state: state, description: text2, isFavorite: false, isFeatured: false, imageURL: "", category: selection, coordinates: GeoPoint(latitude: coordinates.latitude, longitude: coordinates.longitude))
        
        Task{
           try? await PlacesManager().makePlace(landmark, image: image)
        }
    }
}
