//
//  StandingsCountriesView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/10/21.
//

import SwiftUI
import Combine

/* This view displays all the leagues and cups for a specific country
 For now the only thing that it will display is leagues*/
struct StandingsCountriesView: View {
    @State private var countrySelection: Int = 0
    @ObservedObject var standingsViewModel: StandingsListViewViewModel
    let countries: Countries
    let countryLeagues: CountryLeagues
    
    var body: some View {
        VStack(spacing: 0){
            HorizontalScrollView(selection: self.$countrySelection, headerObject: self.countries)
            StandingsLeaguesView(standingsViewModel: self.standingsViewModel,leagues: self.countryLeagues.leagues![countrySelection])
                .id(self.countrySelection)
        }
    }
}

struct StandingsCountriesView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsCountriesView(standingsViewModel: StandingsListViewViewModel(), countries: Countries(), countryLeagues: CountryLeagues())
    }
}
