//
//  CateogryItem.swift
//  Landmarks
//
//  Created by Eric Broussard on 4/25/23.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack (alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
    }
}

struct CateogryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
