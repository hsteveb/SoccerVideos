//
//  HorizontalHeaderInfo.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/9/21.
//

import Foundation

protocol HorizontalHeaderInfoProtocol {
    
    func getCount() -> Int
    func getHeaderValue(index: Int) -> String
}
