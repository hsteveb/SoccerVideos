//
//  SoccerMatchDetailView.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/21/21.
//

import SwiftUI

struct SoccerMatchDetailView: View {
    var match: ScoreBatModel
    var body: some View {
        GeometryReader { geometry in
            VStack {
                            Link(destination: URL(string: match.url)!, label: {
                                AsyncImage(url: URL(string: match.thumbnail)!) {
                                    Text("Loading...")
                                }
                                .frame(width: geometry.size.width, height: geometry.size.height / 3)
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                            })
                            HStack {
                                Link(match.side1.name, destination: URL(string: match.side1.url)!)
                                Text("-")
                                Link(match.side2.name, destination: URL(string: match.side2.url)!)
                                }
                            .frame(width: geometry.size.width, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                Link(match.competition.name.split(separator: ":")[1], destination: URL(string: match.competition.url)!)
                            Spacer()
                        }
                        
            
        }
        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding(.trailing, 10)
        .navigationBarTitle("Match")

    }
}

struct SoccerMatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SoccerMatchDetailView(match: ScoreBatModel(title: "Test1", url: "Test2", thumbnail: "Test3", date: "Test4", side1: ScoreBatSide(name: "Side1", url: "Side1"), side2: ScoreBatSide(name: "Side2", url: "Side2"), competition: ScoreBatCompetition(name: "Competition", url: "Competition")))
    }
}
