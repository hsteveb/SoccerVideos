//
//  ScrollViewKey.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 5/26/21.
//

import SwiftUI

struct ScrollViewKey: PreferenceKey {
    
    static var defaultValue: Double = 0.0
    
    static func reduce(value: inout Double, nextValue: () -> Double) { }
}
