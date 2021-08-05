//
//  More.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 6/21/21.
//

import SwiftUI
import Combine

struct Games: View {
    @ObservedObject var apiFootballNetwork = ApiFootballNetwork()
    let title = "More"
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Header(title: self.title)
                Text("\(self.title) goes here!")
                
                Button("press Me") {
                    //self.scoreBatNetwork.pullRounds()
                    //self.scoreBatNetwork.pullCountries()
                    //self.apiFootballNetwork.pullStandings(season: "2020", optionals: ["league" : "140"])
                }
            }
            
        }
    }
}

struct More_Previews: PreviewProvider {
    static var previews: some View {
        Games()
    }
}
