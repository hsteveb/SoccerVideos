//
//  Table.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 6/21/21.
//

import SwiftUI

struct StandingsMainView: View {
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject var standingsMainViewModel: StandingsMainViewModel
    @EnvironmentObject var standingsViewModel: StandingsListViewViewModel
    @State private var select = 0
    
    private let selection = ["Top Leagues", "Country"]
    let title = "Standings"
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0){
                Header(title: self.title)
                
                /*General selection of which standing you want to see*/
                HStack {
                    ForEach(0..<selection.count) { value in
                        Button(action: {
                            self.select = value
                        }, label: {
                            Text(selection[value])
                        })
                        .frame(height: 40)
                        .font(Font.custom("FredokaOne-Regular", size: 20, relativeTo: .title3))
                        .foregroundColor((self.select == value ? (self.colorScheme == .dark ? .white : .orange) : .gray))
                    }
                    Spacer()
                }
                
                /*Grab the leagues before showing the other views*/
                GeometryReader { geometry in
                    ZStack(alignment: .top) {
                        if standingsMainViewModel.countryLeagues == nil {
                            VStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                        } else { // shows only the top leagues around the world
                            if self.select == 0 {
                                /*Creates a LeaguesModel object that only has the top leagues in the world*/
                                let topLeagues = self.standingsMainViewModel.countryLeagues!.leagues.map({ countryLeagues -> LeaguesModel in
                                    let temp = countryLeagues.compactMap { leagues -> LeaguesModel.Response in
                                        return (leagues.response?[0])!
                                    }
                                    
                                    return LeaguesModel(response: temp)
                                })
                                StandingsLeaguesView(standingsViewModel: self.standingsViewModel, leagues: topLeagues ?? LeaguesModel())
                            } else { // shows all the leagues for each country
                                StandingsCountriesView(standingsViewModel: self.standingsViewModel,countries: self.standingsMainViewModel.countries!, countryLeagues: self.standingsMainViewModel.countryLeagues!)
                            }
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
                }
            }
        }
    }
}

struct Table_Previews: PreviewProvider {
    static var previews: some View {
        StandingsMainView()
    }
}
