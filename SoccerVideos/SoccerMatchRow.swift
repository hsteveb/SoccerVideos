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
    @State var like = false
    
    var body: some View {
        VStack(spacing: 10.0) {
                AsyncImage(url: URL(string: match.scoreBatModel.thumbnail)!) {
                    Color.black
                }
                .aspectRatio(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/, contentMode: .fit)
                //.cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    UIApplication.shared.open(URL(string: match.scoreBatModel.url)!)
                }
            HStack(alignment: .bottom) {
                VStack(spacing: 5.0) {
                    HStack {
                            
                        Link(self.match.scoreBatModel.side1.name, destination: URL(string: self.match.scoreBatModel.side1.url)!)
                        Text("-")
                        Link(self.match.scoreBatModel.side2.name, destination: URL(string: self.match.scoreBatModel.side2.url)!)
                        Spacer()
                    }
                    .font(.headline)
                    
                    HStack {
                        Link(self.match.scoreBatModel.competition.name, destination: URL(string: self.match.scoreBatModel.competition.url)!)
                        Spacer()
                    }
                    .font(.caption2)
                }
                Spacer()
                HStack(alignment:.bottom) {
                    Button(action: {
                        self.like.toggle()
                    }, label:
                            {
                                if self.like {
                                    Image(systemName: "heart.fill")
                                } else {
                                    Image(systemName: "heart")
                                }
                        
                    })
                    Button(action: {
                        let av = UIActivityViewController(activityItems: [match.scoreBatModel.url], applicationActivities: nil)
                        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
                .font(.title2)
            }
            .padding(.leading, 5)
            .padding(.trailing, 5)
            Color.clear
                .frame(height: 10)
            Spacer()
            }
        //.padding(.leading, 10)
        //.padding(.trailing, 10)
        
        
    }
    
    
}

struct SoccerMatchRow_Previews: PreviewProvider {
    static var previews: some View {
        SoccerMatchRow(match: MatchModel(id: 1, scoreBatModel: ScoreBatModel(title: "Test", url: "Test1", thumbnail: "Test2", date: "Test3", side1: ScoreBatSide(name: "Side1", url: "Side1"), side2: ScoreBatSide(name: "Side2", url: "Side2"), competition: ScoreBatCompetition(name: "Competition", url: "Competition"))))
    }
}
