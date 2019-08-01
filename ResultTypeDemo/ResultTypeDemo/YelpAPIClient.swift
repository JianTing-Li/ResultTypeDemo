//
//  YelpAPIClient.swift
//  ResultTypeDemo
//
//  Created by Jian Ting Li on 7/31/19.
//  Copyright © 2019 Jian Ting Li. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badStatusCode
    case apiError(Error)
    case jsonDecodingError(Error)
}

class YelpAPIClient {
    // Result type in Swift 5 in a generic enum used on asychrousnous calls
    // the Result is an enum that validagtes a .success or .failure against the call
    public func searchBusinesses(completion: @escaping (Result<[Venue], NetworkError>) -> Void) {
        
        let endPointURL = "https://api.yelp.com/v3/businesses/search?term=coffee&location=10023"
        
        guard let url = URL(string: endPointURL) else {
            completion(.failure(.badURL))
            return
        }
        var request = URLRequest(url: url)
        let accessToken = ""
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.apiError(error)))
            } else if let data = data {
                do {
                    let venues = try JSONDecoder().decode(YelpContainer.self, from: data).businesses
                    completion(.success(venues))
                } catch {
                    completion(.failure(.jsonDecodingError(error)))
                }
            }
        }
        task.resume()
    }

}
