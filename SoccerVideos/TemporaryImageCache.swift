//
//  TemporaryImageCache.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/27/21.
//

import Foundation
import SwiftUI

struct TemporaryImageCache: ImageCache {
    
    private let cache = NSCache<NSURL, UIImage>()
    subscript(_ key: URL) -> UIImage? {
        get {
            cache.object(forKey: key as NSURL)
        }
        set {
            newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL)
        }
    }
    
    
}

protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}
