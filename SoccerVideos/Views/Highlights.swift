//
//  SoccerVideosList.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/12/21.
//

import SwiftUI

struct Highlights: View {
    let title = "Highlights"
    @ObservedObject var scoreBatNetwork = ScoreBatNetwork()
    @Environment(\.colorScheme) var colorScheme
    @State var select = 0
    @State var refresh = false
    
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        GeometryReader { geometry in
        VStack(spacing: 0) {
            Header(title: self.title, refresh: self.$refresh) {
                if !self.refresh {
                    self.refreshData()
                    let impact = UIImpactFeedbackGenerator(style: .light)
                    impact.impactOccurred()
                }
            }

            List {
                ForEach(self.scoreBatNetwork.matchList) { match in
                    SoccerMatchRow(match: match)
                        .background(colorScheme == .dark ? Color.black : Color.white
                        )
                        .listRowInsets(EdgeInsets())
                        .padding(.top, -1)
                }
            }
            .buttonStyle(BorderlessButtonStyle())
            .listStyle(PlainListStyle()
            )
        }
        }
    }
    
    private func refreshData() {
        withAnimation(.easeInOut(duration: 0.25)) {
            self.refresh = true
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
                self.scoreBatNetwork.pullVideo {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        self.refresh = false
                    }
                }
            }
        }
    }
}

struct SoccerVideosList_Previews: PreviewProvider {
    static var previews: some View {
        Highlights()
    }
}
