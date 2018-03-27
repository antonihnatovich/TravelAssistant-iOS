//
//  CountryDetailedViewController.swift
//  TravelAssistant-iOS
//
//  Created by Anton Ihnatovich on 3/6/18.
//  Copyright © 2018 Anton. All rights reserved.
//

import UIKit
import Kingfisher

class CountryDetailedViewController: UIViewController {
    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryArea: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryPopulation: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryCurrencies: UILabel!
    @IBOutlet weak var countrySubregion: UILabel!
    
    var country: Country?
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        guard let country = country else { return }
        self.title = country.name
        countryName.text = country.name
        countryFlag.kf.setImage(with: URL(string: "http://flags.fmcdn.net/data/flags/w1160/\(country.alpha2.lowercased()).png")!)
        countryCapital.text = country.capital
        countryArea.text = "\(country.area ?? 0)"
        countrySubregion.text = country.subRegion
        countryPopulation.text = "\(country.population ?? 0)"
        var currencies = ""
        country.currencies?.forEach({
            if let name = $0.name, let symbol = $0.symbol, let code = $0.code {
                currencies.append("\(name) - \(symbol) - \(code)\n")
            }
        })
        countryCurrencies.text = currencies.isEmpty ? "-" : currencies
    }
}
