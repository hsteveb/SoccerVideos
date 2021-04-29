//
//  ScoreBatModel.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/12/21.
//

import Foundation

struct ScoreBatModel: Hashable, Codable {
    var title: String
    var url: String
    var thumbnail: String
    var date: String
    var side1: ScoreBatSide
    var side2: ScoreBatSide
    var competition: ScoreBatCompetition
}

struct ScoreBatVideoModel: Hashable, Codable {
    var title: String
    var embed: String
}

struct ScoreBatSide: Hashable, Codable {
    var name: String
    var url: String
}

struct ScoreBatCompetition: Hashable, Codable {
    var name: String
    var url: String
}
