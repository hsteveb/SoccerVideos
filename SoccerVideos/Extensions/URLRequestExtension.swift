//
//  URLRequestExtension.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/9/21.
//

import Foundation

extension URLRequest {
    static func makeURLRequest(endpoint: String, optionals: [String : String]? = nil) -> URLRequest {
        
        let headers = [
        ]
        var urlComponent = URLComponents(string: "https://api-football-v1.p.rapidapi.com/v3/\(endpoint)")!
        urlComponent.queryItems = optionals?.map({ key, value in
            URLQueryItem(name: key, value: value)
        })
        var request = URLRequest(url: urlComponent.url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        return request
    }
}
