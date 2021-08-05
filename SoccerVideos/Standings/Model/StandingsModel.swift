//
//  Standings.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/6/21.
//

import Foundation

struct StandingsModel: Codable {
    private(set) var response: [Response]?
    
    func getConferenceCount() -> Int {
        if let response = self.response {
            return response[0].league.standings.count
        }
        return 0
    }
    func getTeamCount(index: Int = 0) -> Int {
        if let response = self.response {
            return response[0].league.standings[index].count
        }
        return 0
    }
    
    func getTeamStandings(index: Int = 0, index2: Int) -> StandingsResult {
        if response == nil {
            return StandingsResult(team: Team(), all: TeamInfo())
        }
        return (response![0].league.standings[index][index2])
    }
    
    
    struct Response: Codable {
        private(set) var league: League
    }
    
    struct League: Codable {
        private(set) var id: Int?
        private(set) var standings: [[StandingsResult]]
    }
    
    struct StandingsResult: Codable {
        private(set) var rank: Int?
        private(set) var team: Team
        private(set) var points: Int?
        private(set) var goalsDiff: Int?
        private(set) var form: String?
        private(set) var all: TeamInfo
    }
    
    struct TeamInfo: Codable {
        private(set) var played: Int?
        private(set) var win: Int?
        private(set) var draw: Int?
        private(set) var lose: Int?
        private(set) var goals: Goals?
    }
    
    struct Goals: Codable {
        private(set) var fore : Int?
        private(set) var against: Int?
        
        
        enum CodingKeys: String, CodingKey {
            case fore = "for"
            case against
        }
        
        init(from decoder: Decoder) throws {
            let values = try? decoder.container(keyedBy: CodingKeys.self)
            fore = try? values?.decode(Int.self, forKey: .fore)
            against = try? values?.decode(Int.self, forKey: .against)
        }
    }
    
    struct Team: Codable {
        private(set) var id: Int?
        private(set) var name: String?
        private(set) var logo: String?
    }
}
