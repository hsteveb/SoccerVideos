//
//  StandingsRowView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/14/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct StandingsRowView: View {
    @State var stats: statsType = .all
    let team: StandingsModel.StandingsResult?
    
    static let numberFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.formatWidth = 2
        return formatter
    }()
    
    
    enum statsType: String, CaseIterable {
        case lastGames = "Last 5 Games"
        case all = "all"
        case fore = "for"
        case against = "against"
    }
    
    var body: some View {
        HStack(spacing: 0) {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Text(team != nil ? String((team?.rank ?? 0)) : "Team" )
                        .frame(width: team != nil ? geometry.size.width * 1/10 : geometry.size.width, alignment: .leading)
                    
                    if let team = team {
                        HStack(spacing: 0) {
                            WebImage(url: URL(string: team.team.logo ?? ""))
                                .resizable()
                                .frame(width: 25, height: 25, alignment: .center)
                            Text(team.team.name ?? "Team Name")
                        }
                        .frame(width: geometry.size.width * 9/10, alignment: .leading)
                    }
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .frame(width: 160, alignment: .center)
            //.background(Color.gray)
            
            Spacer()
            
            if team == nil {
                switch self.stats {
                case .lastGames:
                    Text("Last 5 Games")
                default:
                    StandingsStatsView(stats: ["MP", "W", "D", "L", "GF", "GA", "GD"])
                }
            } else {
                switch self.stats {
                case .lastGames:
                    StandingsPreviousGamesView(form: team?.form ?? "")
                    
                default:
                    StandingsStatsView(stats: [String(team?.all.played ?? 0),
                                               String(team?.all.win ?? 0),
                                               String(team?.all.lose ?? 0),
                                               String(team?.all.draw ?? 0),
                                               String(team?.all.goals?.fore ?? 0),
                                               String(team?.all.goals?.against ?? 0),
                                               String((team?.all.goals?.fore ?? 0) - (team?.all.goals?.against ?? 0))
                    ])
                }
            }
            Spacer()
            Text(self.team == nil ? "Pts" : String(self.team?.points ?? 0))
                .frame(width: 20)
            //.background(Color.gray)
        }
    }
}

struct StandingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsRowView(stats: .all, team: nil)
    }
}
