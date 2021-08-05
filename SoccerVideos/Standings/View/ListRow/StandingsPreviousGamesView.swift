//
//  PreviousGames.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/14/21.
//

import SwiftUI

struct StandingsPreviousGamesView: View {
    let form: String
    var body: some View {
        HStack {
            let array = Array(form)
            ForEach(0..<array.count, id: \.self) { value in
                switch array[value].uppercased() {
                case "W":
                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                case "L":
                    Circle()
                        .fill(Color.red)
                        .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                case "D":
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                default:
                    Color.clear
                }
            }
        }
    }
}

struct PreviousGames_Previews: PreviewProvider {
    static var previews: some View {
        StandingsPreviousGamesView(form: "WWDLL")
    }
}
