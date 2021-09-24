//
//  ViewController.swift
//  Starship
//
//  Created by Debashree on 23/9/21.
//
// theme color :::: #4F6395
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let apiFeed = APIFeed()
    var starshipsList = [StarshipsList]()
    {
        didSet{
                self.tableView.reloadData()
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.showLoader(nil)
        self.navigationItem.title = "Home"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getStarships()
    }
    
    func getStarships() {
        apiFeed.requestAPIInfo { result in
            //  print("The response is :::::::\(result)")
            DispatchQueue.main.async{
                switch result {
                case.success(let data):
                    if let starshipmodel = data.results {
                        self.starshipsList = starshipmodel
                    }
                // self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
                self.view.dismissLoader()
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starshipsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarshipCell", for: indexPath) as! StarshipCell
        cell.starship = self.starshipsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.starship = self.starshipsList[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
