//
//  FavouritesViewController.swift
//  Starship
//
//  Created by Debashree on 24/9/21.
//

import UIKit

class FavouritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var datasource = [StarshipsList]() {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Favourites"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.datasource = FavouriteManager.shared.favourites
    }
    

}

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as! StarshipCell
        let item = self.datasource[indexPath.row]
        cell.starship = item
        cell.delegate = self
        if FavouriteManager.shared.isFavourite(item: item) {
            cell.setFavourite(state: true)
        } else {
            cell.setFavourite(state: false)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.starship = self.datasource[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension FavouritesViewController: StarshipCellDelegate {
    func didActionFavourite(cell: StarshipCell) {
        ///save to userdefaults
        guard let index = tableView.indexPath(for: cell) else { return }
        let item = datasource[index.row]

        FavouriteManager.shared.addFavourite(item: item)
        tableView.reloadData()
        self.datasource = FavouriteManager.shared.favourites
    }
}
