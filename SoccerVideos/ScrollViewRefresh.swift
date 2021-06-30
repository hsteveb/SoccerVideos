//
//  CustomScrollView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 5/28/21.
//

import SwiftUI

struct ScrollViewRefresh<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var network: ScoreBatNetwork
    @State private var offset = 0.0
    @State private var refresh = false
    @State private var once = false
    @State private var opacity = 0.0
    private let threshold = 60.0
    private let content: () -> Content
    @State private var rep = false
    
    init(network: ScoreBatNetwork, @ViewBuilder content: @escaping () -> Content) {
        self.network = network
        self.content = content
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
            /*ProgressView shown to refresh data for the scrollview.*/
            VStack(spacing: 0) {
                
                Header(refresh: self.$refresh) {
                    if !self.refresh {
                        self.refreshData()
                        let impact = UIImpactFeedbackGenerator(style: .light)
                        impact.impactOccurred()
                    }
                }

                List {
                    content()
                }
                .buttonStyle(BorderlessButtonStyle())
                .listStyle(PlainListStyle()
                )
            }
    }
    
    func refreshData() {
        withAnimation(.easeInOut(duration: 0.25)) {
            self.refresh = true
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
                self.network.pullVideo {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        self.refresh = false
                    }
                }
            }
        }
    }
    
}




struct ScrollViewRefresh_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewRefresh(network: ScoreBatNetwork()) {
            Text("1")
        }
    }
}

