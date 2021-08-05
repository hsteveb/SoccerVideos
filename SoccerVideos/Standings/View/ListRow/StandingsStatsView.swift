//
//  StandingsStatsView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/14/21.
//

import SwiftUI

struct StandingsStatsView: View {
    let stats: [String]?
    var body: some View {
        HStack(spacing: 3){
        if let stats = stats {
            ForEach(stats, id: \.self) { value in
                Text(value)
                    .frame(width: 20)
            }
        }
    }
    }
}

struct StandingsStatsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsStatsView(stats: ["MP", "W", "D", "L", "GF", "GA", "GD"])
    }
}
