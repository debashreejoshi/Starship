//
//  FavouriteManager.swift
//  Starship
//
//  Created by Debashree on 25/9/21.
//

import Foundation

class FavouriteManager {
    static let shared = FavouriteManager()
    
    var favourites: [StarshipsList] = []
    
    private init() {}
    
    func isFavourite(item: StarshipsList) -> Bool {
        return favourites.contains(where: { value in
            value.name == item.name
        })
    }
    
    func addFavourite(item: StarshipsList) {
        if isFavourite(item: item) {
            favourites.removeAll { value in
                value.name == item.name
            }
        } else {
            favourites.append(item)
        }
    }
}
