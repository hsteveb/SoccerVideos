//
//  ScoreBatNetwork.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/18/21.
//

import Foundation

class ScoreBatNetwork: ObservableObject {
    @Published var matchList = [MatchModel]()
    
    init() {
        self.pullVideo()
    }
    
    
    func pullVideo()  {
        
        let path = "https://www.scorebat.com/video-api/v1/"
        let url = URL(string: path)
        URLSession.shared.dataTask(with: url!) { data, error , _ in
            if let data = data {
                
                let decoder = JSONDecoder()
                
                if let jsonResult = try? decoder.decode([ScoreBatModel].self, from: data) {
                    var matchList = [MatchModel]()
                    for match in jsonResult {
                        matchList.append(MatchModel(id: UUID().hashValue, scoreBatModel: match))
                    }
                    DispatchQueue.main.async {
                        self.matchList = matchList
                    }
                } else {
                    print("Oops something is wrong.")
                }
            }
        }.resume()
    }
}
