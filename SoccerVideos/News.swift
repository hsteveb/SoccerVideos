//
//  News.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 6/21/21.
//

import SwiftUI

struct News: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Header(title: "News")
                
                Text("News goes here!")
            }
        }
    }
}

struct News_Previews: PreviewProvider {
    static var previews: some View {
        News()
    }
}
