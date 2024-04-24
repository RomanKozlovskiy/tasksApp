//
//  CountriesProvider.swift
//  TasksApp
//
//  Created by user on 23.04.2024.
//

import Foundation

final class CountriesProvider {
    let countriesApiClient: CountriesApiClient
    
    init(countriesApiClient: CountriesApiClient) {
        self.countriesApiClient = countriesApiClient
    }
    
    func fetchCountries(completion: @escaping (CountryList?) -> Void) {
        countriesApiClient.makeRequest(type: CountryList.self) { result in
            switch result {
            case .success(let countryList):
                DispatchQueue.main.async {
                    completion(countryList)
                }
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}