//
//  More.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 6/21/21.
//

import SwiftUI

struct More: View {
    let title = "More"
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Header(title: self.title)
                Text("\(self.title) goes here!")
            }
            
        }
    }
}

struct More_Previews: PreviewProvider {
    static var previews: some View {
        More()
    }
}
