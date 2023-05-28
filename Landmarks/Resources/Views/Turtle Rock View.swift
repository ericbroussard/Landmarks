//
//  Turtle Rock View.swift
//  Landmarks
//
//  Created by Eric Broussard on 4/25/23.
//

import SwiftUI

struct Turtle_Rock_View: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay{
                
                Circle().stroke(.white, lineWidth: 4)
                
            }
            .shadow(radius: 7)
    }
}

struct Turtle_Rock_View_Previews: PreviewProvider {
    static var previews: some View {
        Turtle_Rock_View()
    }
}
