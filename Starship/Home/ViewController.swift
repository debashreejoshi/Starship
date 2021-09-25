//
//  ViewController.swift
//  Starship
//
//  Created by Debashree on 23/9/21.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let apiFeed = APIFeed()
    
    var datasource: [StarshipsList] = [StarshipsList]() {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.showLoader(nil)
        self.navigationItem.title = "Home"
        self.setBarBtn()
        self.setUpRightBarDropDown()
        DropDown.appearance().selectionBackgroundColor = UIColor.init(hexString: "#4F6395")
        DropDown.appearance().selectedTextColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.getStarships()
    }
    
    func getStarships() {
        self.apiFeed.requestAPIInfo { starshipsModel in
            self.datasource = starshipsModel.results ?? []
        } onError: { errorMessage in
            self.displayAlert(errorMessage: errorMessage)
        }
        self.view.dismissLoader()
    }
    
    func setBarBtn() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(barbtnTapped))
    }
    
    @objc func barbtnTapped() {
        dropDown.show()
    }
    
    func setUpRightBarDropDown() {
        dropDown.anchorView = navigationItem.rightBarButtonItem
        dropDown.bottomOffset = CGPoint(x: 0, y: 50)
        dropDown.dataSource = ["Name", "Model", "Starship Class", "Capacity High First", "Capacity Low First"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            
            switch index {
            case 0:
                self.datasource = datasource.sorted { first, second in
                    first.name ?? "" < second.name ?? ""
                }
            case 1:
                self.datasource = datasource.sorted { first, second in
                    first.model ?? "" < second.model ?? ""
                }
            case 2:
                self.datasource = datasource.sorted {
                    $0.starship_class ?? "" < $1.starship_class ?? ""
                }
            case 3:
                self.datasource = datasource.sorted {first, second in  first.cargo_capacity?.localizedStandardCompare (second.cargo_capacity ?? "") == .orderedDescending
                }
            case 4:
                self.datasource = datasource.sorted {first, second in  first.cargo_capacity?.localizedStandardCompare (second.cargo_capacity ?? "") == .orderedAscending
                }
            default:
                break
            }
            self.tableView.reloadData()
        }
    }
    
    func displayAlert(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarshipCell", for: indexPath) as! StarshipCell
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

extension ViewController: StarshipCellDelegate {
    func didActionFavourite(cell: StarshipCell) {
        //save to userdefaults
        guard let index = tableView.indexPath(for: cell) else { return }
        let item = datasource[index.row]
        FavouriteManager.shared.addFavourite(item: item)
        tableView.reloadData()
    }
}

