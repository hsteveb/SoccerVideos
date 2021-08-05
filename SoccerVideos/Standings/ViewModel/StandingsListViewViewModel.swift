//
//  File.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/9/21.
//

import SwiftUI
import Combine

class StandingsListViewViewModel: ObservableObject{
    @Published var standings = [Int : StandingsModel]()
    private var requests = Set<AnyCancellable>()
    private let decoder = JSONDecoder()
    
    func pullStandings(optionals: [String : String] = [String: String]()) {
        URLSession.shared.dataTaskPublisher(for: URLRequest.makeURLRequest(endpoint: "standings", optionals: optionals))
            .map(\.data)
            .decode(type: StandingsModel.self, decoder: self.decoder)
            .receive(on: DispatchQueue.main)
            .replaceError(with: StandingsModel())
            .sink(receiveValue: { leagueStandings in
                guard let response = leagueStandings.response,
                      response.count > 0 else { return }
                self.standings[response[0].league.id!] = leagueStandings
                
                //print("added new standings")
                //print(leagueStandings)
            })
            .store(in: &requests)
    }
}
