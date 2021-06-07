//
//  ScoreBatNetwork.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 4/18/21.
//

import Foundation
import Combine

class ScoreBatNetwork: ObservableObject {
    @Published var matchList = [MatchModel]()
    private var requests = Set<AnyCancellable>()
    
    init() {
        self.pullVideo {
            //print(Test)
        }
    }
    
    
    func pullVideo(content: @escaping () -> Void)  {
        DispatchQueue.main.async {
            self.matchList = [MatchModel]()
        }
       
        let path = "https://www.scorebat.com/video-api/v1/"
        let url = URL(string: path)
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTaskPublisher(for: url!)
            .retry(1)
            .map(\.data)
            .decode(type: [ScoreBatModel].self, decoder: decoder)
            .replaceError(with: [ScoreBatModel]())
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                    var matchList = [MatchModel]()
                    for match in $0 {
                        matchList.append(MatchModel(id: UUID().hashValue, scoreBatModel: match))
                    }
                    self.matchList = matchList
                content()
            })
            .store(in: &requests)
            
    }
}
