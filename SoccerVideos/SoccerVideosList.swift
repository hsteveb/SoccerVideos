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
            if scoreBatNetwork.matchList.count <= 0 {
                ProgressView()
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(self.scoreBatNetwork.matchList, id: \.id) { match in
                            SoccerMatchRow(match: match)
                                .aspectRatio(1.5, contentMode: .fit)
                        }
                    }
                }
                .navigationBarTitle("Videos")
            }
        
    }

}

struct SoccerVideosList_Previews: PreviewProvider {
    static var previews: some View {
        SoccerVideosList()
    }
}
