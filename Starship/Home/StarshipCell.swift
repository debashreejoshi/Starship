//
//  StarshipCell.swift
//  Starship
//
//  Created by Debashree on 23/9/21.
//

import UIKit

protocol StarshipCellDelegate {
    func didActionFavourite(cell: StarshipCell)
}

class StarshipCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblModel: UILabel!
    @IBOutlet weak var lblStarshipClass: UILabel!
    @IBOutlet weak var lblCargoCapacity: UILabel!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var btnFavourite: UIButton!
    
    var delegate: StarshipCellDelegate?
    
    var starship: StarshipsList? {
        didSet {
            self.lblName.text = starship?.name ?? ""
            self.lblModel.text = starship?.model ?? ""
            self.lblStarshipClass.text = starship?.starship_class ?? ""
            self.lblCargoCapacity.text = "Capacity \(starship?.cargo_capacity ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.uiConfig()
    }
    
    func uiConfig() {
        self.outerView.set(cornerRadius: 5)
        self.outerView.setCardView()
    }
    
    func setFavourite(state: Bool) {
        if state {
            btnFavourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            btnFavourite.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func btnFavouriteTapped(_ sender: Any) {
        self.delegate?.didActionFavourite(cell: self)
    }
}
