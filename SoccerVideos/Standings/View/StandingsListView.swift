//
//  StandingsListView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/9/21.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct StandingsListView: View {
    @State var stats: StandingsRowView.statsType = .all
    let standings: StandingsModel
    
    init(standings: StandingsModel, stats: StandingsRowView.statsType) {
        self.standings = standings
        //self.stats = stats
        UITableViewHeaderFooterView.appearance().backgroundView = .init()
        UITableViewHeaderFooterView.appearance().backgroundView?.backgroundColor = UIColor.systemBackground
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
            List {
                Section(header: VStack(spacing: 0) {
                             /*TabView() {
                                 ForEach(0..<StandingsRowView.statsType.allCases.count, id: \.self) { value in
                                     HStack {
                                         Spacer()
                                         Text(StandingsRowView.statsType.allCases[value].rawValue)
                                         Spacer()
                                     }
                                     .tag(StandingsRowView.statsType.allCases[value])
                                 }
                                 //.font(Font.custom("FredokaOne-Regular", size: 20, relativeTo: .body))
                                 .background(Color.blue)
                             }
                             .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))*/
                    StandingsRowView(stats: self.stats, team: nil)
                }
                //.frame(height: 50)
                ){
                    ForEach(0..<self.standings.getTeamCount(), id: \.self) { value in
                        let team = self.standings.getTeamStandings(index2: value)
                        StandingsRowView(stats: self.stats, team: team)
                    }
                }
                .listRowInsets(EdgeInsets())
                .font(Font.custom("FredokaOne-Regular", size: 12))
                .textCase(.none)
        }
    }
}

struct StandingsListView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsListView(standings: StandingsModel(), stats: .all)
    }
}
