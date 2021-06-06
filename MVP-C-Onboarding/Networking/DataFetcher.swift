//
//  DataFetcher.swift
//  MVP-C-Onboarding
//
//  Created by David on 06/06/2021.
//

import Foundation

final class DataFetcher {
    // General data fetching function including url parameters
    static func getData(url: String, parameters: [String: String] = [:], completion: @escaping (Data?) -> Void) {
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask?
        
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: url) {
            urlComponents.queryItems = parameters.map {URLQueryItem(name: $0, value: $1)}

            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer {
                    dataTask = nil
                }
                
                if let responseData = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    completion(responseData)
                                        
                } else if let error = error {
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
            dataTask?.resume()
        }
    }
}
