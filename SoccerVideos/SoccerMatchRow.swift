//
//  SoccerMatchRow.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/18/21.
//

import SwiftUI

struct SoccerMatchRow: View {
    @State var value = true
    @State var match: MatchModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AsyncImage(url: URL(string: match.scoreBatModel.thumbnail)!) {
                    Text("")
                }
                .onTapGesture {
                    UIApplication.shared.open(URL(string: match.scoreBatModel.url)!)
                }
                .cornerRadius(3.0)
                
                
                
                HStack {
                    Link(self.match.scoreBatModel.side1.name, destination: URL(string: self.match.scoreBatModel.side1.url)!)
                    Text("-")
                    Link(self.match.scoreBatModel.side2.name, destination: URL(string: self.match.scoreBatModel.side2.url)!)
                    
                    Spacer()
                }
                .font(.body)
                
                HStack {
                    Link(self.match.scoreBatModel.competition.name, destination: URL(string: self.match.scoreBatModel.competition.url)!)
                    Spacer()
                }
                .font(.footnote)
            }
            .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }

    }
    
    
}

struct SoccerMatchRow_Previews: PreviewProvider {
    static var previews: some View {
        SoccerMatchRow(match: MatchModel(id: 1, scoreBatModel: ScoreBatModel(title: "Test", url: "Test1", thumbnail: "Test2", date: "Test3", side1: ScoreBatSide(name: "Side1", url: "Side1"), side2: ScoreBatSide(name: "Side2", url: "Side2"), competition: ScoreBatCompetition(name: "Competition", url: "Competition"))))
    }
}
