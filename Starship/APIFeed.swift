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
    
    func requestAPIInfo(completion: @escaping(Result<StarshipsModel, Error>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
            
            guard error == nil else {
                print (error!.localizedDescription)
                print ("error in data task")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let jsonData = try decoder.decode(StarshipsModel.self, from: data!)
                completion(.success(jsonData))
            }
            catch {
                print ("an error in catch")
                print (error)
            }
            
            
        
        }
        dataTask.resume()
    }
}
