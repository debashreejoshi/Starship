//
//  APIFeed.swift
//  Starship
//
//  Created by Debashree on 24/9/21.
//

import Foundation

struct APIFeed {
    
    var resourceURL: URL
    let urlString = "https://swapi.dev/api/starships/"
    
    init() {
        resourceURL = URL(string: urlString)!
    }
    
    //create method to get decode the json
    
    func requestAPIInfo(onSuccess: @escaping (StarshipsModel) -> (), onError: @escaping (String) -> ()) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
          
            DispatchQueue.main.sync {
                if let _error = error {
                    onError(_error.localizedDescription)
                    return
                }
                guard let data = data else {
                    onError("Invalid data or response")
                    return
                }
                do {
                    let jsonData = try JSONDecoder().decode(StarshipsModel.self, from: data)
                    onSuccess(jsonData)
                    
                } catch {
                    onError(error.localizedDescription)
                }
            }
        }
        dataTask.resume()
    }
}
