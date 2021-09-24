//
//  DetailViewController.swift
//  Starship
//
//  Created by Debashree on 23/9/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblModel: UILabel!
    @IBOutlet weak var lblCrew: UILabel!
    @IBOutlet weak var lblPassenger: UILabel!
    @IBOutlet weak var lblStarshipClass: UILabel!
    @IBOutlet weak var lblCostCredits: UILabel!
    @IBOutlet weak var lblLength: UILabel!
    @IBOutlet weak var lblCargoCapacity: UILabel!
    @IBOutlet weak var lblCosumables: UILabel!
    @IBOutlet weak var lblHyperdrive: UILabel!
    @IBOutlet weak var lblMGLT: UILabel!
    @IBOutlet weak var lblMaxAtmosphering: UILabel!
    
    @IBOutlet weak var lblManufacturedBy: UILabel!
    @IBOutlet weak var outerView: UIView!
    
    var starship: StarshipsList?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = starship?.name ?? "Detail"
        self.setUpValues()
        self.uiConfig()
    }
    
    func uiConfig() {
        self.outerView.set(cornerRadius: 20)
        self.outerView.setCardView()
    }
    func setUpValues() {
        self.lblName.text = starship?.name
        self.lblModel.text = starship?.model
        self.lblCrew.text = starship?.crew
        self.lblPassenger.text = starship?.passengers
        self.lblStarshipClass.text = "Starship Class: \(starship?.starship_class ?? "")"
        self.lblCostCredits.text = "Cost in credits: $ \(starship?.cost_in_credits ?? "")"
        self.lblLength.text = "Length: \(starship?.length ?? "")"
        self.lblCargoCapacity.text = "Cargo Capacity: \(starship?.cargo_capacity ?? "")"
        self.lblCosumables.text = "Consumables: \(starship?.consumables ?? "")"
        self.lblHyperdrive.text = "Hyperdrive rating: \(starship?.hyperdrive_rating ?? "")"
        self.lblMGLT.text = "MGLT: \(starship?.MGLT ?? "")"
        self.lblMaxAtmosphering.text = "Max Atmosphering Speed: \(starship?.max_atmosphering_speed ?? "")"
        self.lblManufacturedBy.text = "\(starship?.manufacturer ?? "")"
    }
    
}
