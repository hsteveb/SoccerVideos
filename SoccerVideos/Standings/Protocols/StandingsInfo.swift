//
//  StandingsInfo.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/10/21.
//

import Foundation


/* Helps grab information needed to get the standings for league, cup, and competition*/
protocol StandingsInfo {
    func getStandingsOptions(index: Int) -> [String: String]
}
