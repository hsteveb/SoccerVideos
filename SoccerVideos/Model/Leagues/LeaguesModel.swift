//
//  League.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/6/21.
//

import Foundation

struct LeaguesModel: Codable, HorizontalHeaderInfoProtocol, StandingsInfo {
    private(set) var response: [Response]?
    
    func getCount() -> Int {
        response?.count ?? 0
    }
    
    func getHeaderValue(index: Int) -> String {
        guard let response = response,
              let leauge = response[index].league else { return ""}
        return leauge.name
    }
    
    func getStandingsOptions(index: Int) -> [String : String] {
        guard let response = response,
              let league = response[index].league else {return [String: String]()}
        
        return ["id": String((league.id))]
    }
    
    struct Response: Codable {
        private(set) var league: League?
        private(set) var country: Country?
        private(set) var seasons: [Season]?
    }
    
    struct League: Codable {
        private(set) var id: Int
        private(set) var name: String
        private(set) var type: String
        private(set) var logo: String
        
    }
    
    struct Season: Codable {
        private(set) var year: Int
        private(set) var start: String
        private(set) var end: String
        private(set) var current: Bool
        private(set) var coverage: Coverage
    }
    
    struct Coverage: Codable {
        private(set) var fixtures: Fixtures
        private(set) var standings: Bool
        private(set) var players:  Bool
    }
    
    struct Fixtures: Codable {
        private(set) var events: Bool
        private(set) var lineups: Bool
    }
}
