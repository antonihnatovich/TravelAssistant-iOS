//
//  CountryTableViewCell.swift
//  TravelAssistant-iOS
//
//  Created by Anton Ihnatovich on 2/5/18.
//  Copyright © 2018 Anton. All rights reserved.
//

import UIKit
import Kingfisher

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        flagImageView.contentMode = .scaleAspectFill
        flagImageView.layer.cornerRadius = flagImageView.layer.bounds.height / 2
        // Initialization code
    }
    
    func bind(with country: Country) {
        flagImageView.kf.setImage(with: URL(string: "http://flags.fmcdn.net/data/flags/w1160/\(country.alpha2.lowercased()).png")!)
    }

}
