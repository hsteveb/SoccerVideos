//
//  CountryLeagues.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/11/21.
//

import Foundation

struct CountryLeagues: HorizontalHeaderInfoProtocol {
    private(set) var leagues: [LeaguesModel]?
    
    func getCount() -> Int {
        leagues?.count ?? 0
    }
    
    func getHeaderValue(index: Int) -> String {
        leagues?[index].getHeaderValue(index: 0) ?? ""
    }
}
