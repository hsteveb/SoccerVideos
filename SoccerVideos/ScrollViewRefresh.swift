//
//  CustomScrollView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 5/28/21.
//

import SwiftUI

struct ScrollViewRefresh<Content: View>: View {
    @ObservedObject var network: ScoreBatNetwork
    @State private var offset = 0.0
    @State private var refresh = false
    @State private var disable = false
    private let threshold = 60.0
    private let content: () -> Content

    init(network: ScoreBatNetwork, @ViewBuilder content: @escaping () -> Content) {
        self.network = network
        self.content = content
    }

  var body: some View {
    ZStack(alignment: .center) {
        /*ProgressView shown to refresh data for the scrollview.*/
        /*VStack {
            Text("Refresh")
            Spacer()
        }
        .frame(height: 60)
        .opacity(self.refresh ? 0 : self.offset)*/
        if self.refresh {
            ProgressView()
        } else {
            ScrollView(showsIndicators: false) {
                offsetReader
                content()
            }
            .coordinateSpace(name: "frameLayer")
            .onPreferenceChange(ScrollViewKey.self, perform: { value in
                //print(value)
                self.offset = value / threshold
                if value >= self.threshold && !self.refresh {
                    self.refreshData()
                    let impact = UIImpactFeedbackGenerator(style: .light)
                    impact.impactOccurred()
                }
            })
        }

    }
  }

    /*View used to measure the offset on the ScrollView to reach the threshold.*/
  var offsetReader: some View {
    GeometryReader { proxy in
      Color.clear
        .preference(
          key: ScrollViewKey.self,
            value: Double(proxy.frame(in: .named("frameLayer"
            )).minY)
        )
    }
    .frame(height: 0)
  }
    
    func refreshData() {
        withAnimation(.easeInOut(duration: 0.1)) {
            self.refresh = true
            
            
            DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.seconds(1)) {
                self.disable = true
                self.network.pullVideo {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        self.refresh = false
                        self.disable = false
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

