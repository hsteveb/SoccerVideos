//
//  Countries.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/6/21.
//

import Foundation

struct Countries: Codable, HorizontalHeaderInfoProtocol {
    private(set) var response: [Country]?
    
    func getCount() -> Int {
        response?.count ?? 0
    }
    
    func getHeaderValue(index: Int) -> String {
        response?[index].name ?? ""
    }
}
