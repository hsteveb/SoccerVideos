//
//  SoccerVideosList.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/12/21.
//

import SwiftUI

struct SoccerVideosList: View {
    @ObservedObject var scoreBatNetwork = ScoreBatNetwork()
    
    var body: some View {
        GeometryReader { geometry in
        NavigationView {
            ScrollViewRefresh(network: scoreBatNetwork) {
                LazyVStack(spacing: 20) {
                    ForEach(self.scoreBatNetwork.matchList) { match in
                        SoccerMatchRow(match: match)
                            //.frame(width: geometry.size.width, height: geometry.size.height / 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            //.frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    }
}

struct SoccerVideosList_Previews: PreviewProvider {
    static var previews: some View {
        SoccerVideosList()
    }
}
