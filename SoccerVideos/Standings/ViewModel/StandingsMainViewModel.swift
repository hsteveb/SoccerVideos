//
//  StandingsMainViewModel.swift
//  SoccerVideos
//
//  Created by Hector Barrios on 7/10/21.
//

import Foundation
import Combine

class StandingsMainViewModel: ObservableObject {
    @Published var countries: Countries?
    @Published var countryLeagues: CountryLeagues?
    private var requests = Set<AnyCancellable>()
    private let decoder = JSONDecoder()
    
    init() {
        self.pullCountries()
        print("\(self): initialized")
    }
    
    /*Gets a list of all the countries and filters them out to get the top 7 countries*/
    func pullCountries() {
        URLSession.shared.dataTaskPublisher(for: URLRequest.makeURLRequest(endpoint: "countries"))
            .retry(1)
            .map(\.data)
            .decode(type: Countries.self, decoder: self.decoder)
            .map({ countries in
                //print(countries)
                let temp = countries.response?.filter({ country in
                    switch country.name?.lowercased() {
                    case "spain", "england", "italy", "germany", "france", "mexico", "usa":
                        return true
                    default:
                        return false
                    }
                })
                return Countries(response: temp)
            })
            .replaceError(with: Countries())
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { countries in
                //print(countries)
                self.countries = countries
                self.pullLeagues()
            })
            .store(in: &requests)
    }
    
    /*Gets all the leagues for all the countries and puts them on an array*/
    func pullLeagues() {
        guard let countries = self.countries else { return }
        
        let publishers: [AnyPublisher<LeaguesModel, Error>] = countries.response!.map { country -> AnyPublisher<LeaguesModel, Error> in
            let code = country.code
            
            return URLSession.shared.dataTaskPublisher(for: URLRequest.makeURLRequest(endpoint: "leagues", optionals: ["code" : code!, "type" : "league"]))
                .map(\.data)
                .decode(type: LeaguesModel.self, decoder: self.decoder)
                .eraseToAnyPublisher()
        }
        
        var leagues = [String: LeaguesModel]()
    
        
        /*Merge all the leagues for each country*/
        Publishers.MergeMany(publishers)
            .compactMap {
                leagues[($0.response?[0].country?.code)!] = $0
                //print($0.response?[0].league?.name)
                return $0
            }
            .replaceError(with: LeaguesModel())
            .collect()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { leagues2 in
                var temp = [LeaguesModel]()
                for country in countries.response! {
                    temp.append(leagues[(country.code!)]!)
                }
                self.countryLeagues = CountryLeagues(leagues: temp)
            })
            .store(in: &requests)

    }
}
