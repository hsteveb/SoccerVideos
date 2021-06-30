//
//  Table.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 6/21/21.
//

import SwiftUI

struct Standings: View {
    let title = "Standings"
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Header(title: self.title)
                Text("\(self.title) goes here!")
            }
        }
    }
}

struct Table_Previews: PreviewProvider {
    static var previews: some View {
        Standings()
    }
}
