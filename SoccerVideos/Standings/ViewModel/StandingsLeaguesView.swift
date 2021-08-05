//
//  StandingsLeaguesView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/9/21.
//

import SwiftUI

/*This view only displays the top leagues in the world*/
struct StandingsLeaguesView: View {
    @State private var selection: Int = 0
    @State var stats: StandingsRowView.statsType = .all
    @ObservedObject var standingsViewModel: StandingsListViewViewModel
    let leagues: LeaguesModel
    private let LOG = "StandingsLeaguesView"
    
    init(standingsViewModel: StandingsListViewViewModel, leagues: LeaguesModel) {
        self.standingsViewModel = standingsViewModel
        self.leagues = leagues
        self.showLeague(index: self.selection)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            if let response = leagues.response {
                HorizontalScrollView(selection: self.$selection, headerObject: self.leagues)
                    .frame(height: 50)
                    .font(.title)
                
                if let id = response[self.selection].league?.id, // get id for selected league
                   let standings = self.standingsViewModel.standings[id]{ // get standings with id
                    StandingsListView(standings: standings, stats: self.stats)
                }
                else { // Show progressview so that the standings can load
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            } else { // If leagues.response is empty show this
                Spacer()
                Text("Something went wrong")
                Spacer()
            }
        }
        .onChange(of: self.selection, perform: { value in
            self.showLeague(index: value)
        })
    }
    
    private func showLeague(index: Int) {
        guard let response = leagues.response,
              let league = response[index].league,
              let season = response[index].seasons else { return }
        
        let year = season[season.count-1].current && season[season.count-1].coverage.standings ? season[season.count-1].year : season[season.count-2].year
        
        if standingsViewModel.standings[league.id] == nil {
            self.standingsViewModel.pullStandings(optionals: ["league" : String(league.id), "season" : String(year)])
        }
    }
}

struct StandingsLeaguesView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsLeaguesView(standingsViewModel: StandingsListViewViewModel(), leagues: LeaguesModel())
    }
}
