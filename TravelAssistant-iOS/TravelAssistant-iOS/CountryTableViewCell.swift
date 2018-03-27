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
        flagImageView.layer.cornerRadius = flagImageView.layer.bounds.height / 2
    }
    
    override func prepareForReuse() {
        countryNameLabel.text = ""
        countryCapitalLabel.text = ""
    }
    
    func bind(with country: Country) {
        flagImageView.kf.setImage(with: URL(string: "http://flags.fmcdn.net/data/flags/w1160/\(country.alpha2.lowercased()).png")!)
        countryCapitalLabel.text = country.capital
        countryNameLabel.text = country.name
    }

}
