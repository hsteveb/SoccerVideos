//
//  StandingsLeaguesView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/9/21.
//

import SwiftUI

/*This view only displays the top leagues in the world*/
struct StandingsTopLeaguesView: View {
    let topLeagues: LeaguesModel
    @State var selection: Int = 0
    var body: some View {
        VStack {
            HorizontalScrollView(selection: self.$selection, headerObject: self.topLeagues)
            TabView(selection: self.$selection) {
                ForEach(0..<topLeagues.getCount()) { value in
                    /*StandingsListView(name: )
                        .tag(value)
                        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(.trailing, 10)*/
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

struct StandingsLeaguesView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsTopLeaguesView(topLeagues: LeaguesModel())
    }
}
