//
//  ApiFootballNetwork.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/9/21.
//

import Foundation
import Combine

class ApiFootballNetwork: ObservableObject {
    @Published var apiInfo = [String: Any]()
    @Published var countries: Countries?
    @Published var leagues: CountryLeagues?
    private var requests = Set<AnyCancellable>()
    private let decoder = JSONDecoder()
    
    init() {
        //self.pullCountries()
    }
    
    
    /* Pulls all the rounds for a specific league and season*/
    func pullRounds(league: Int = 140, season: String = "2021") {
        var request = URLRequest(url: URL(string: "https://api-football-v1.p.rapidapi.com/v3/fixtures/rounds?league=140&season=2021")!)
        request.httpMethod = "GET"
        //request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: FixtureRounds.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .replaceError(with: FixtureRounds())
            .sink(receiveValue: { value in
                //print(value.response)
            })
            .store(in: &requests)
    }
}
