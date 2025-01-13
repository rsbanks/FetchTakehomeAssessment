//
//  APIService.swift
//  FetchTakehomeAssessment
//
//  Created by Rebecca Banks on 1/11/25.
//

import Foundation

class APIService {

    private let urlString: String

    init(urlString: String = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") {
        self.urlString = urlString
    }

    func getAPIData(completion: @escaping ([Recipe]?, String?) -> ()) {

        if let apiUrl = URL(string: urlString) {
            URLSession.shared.dataTask(with: apiUrl) { apiData, urlResponse, error in
                DispatchQueue.main.async {
                    if let error {
                        completion(nil, error.localizedDescription)
                    } else if let response = urlResponse as? HTTPURLResponse, response.statusCode != 200 {
                        completion(nil, "Status code \(response.statusCode)")
                    } else if let apiData {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let data = try? decoder.decode(APIResult.self, from: apiData)
                        completion(data?.recipes, nil)
                    } else {
                        completion(nil, "Unable to retrieve data")
                    }
                }
            }.resume()
        }
    }
}
