//
//  QuestionBuilder.swift
//  TravelAssistant-iOS
//
//  Created by Anton Ihnatovich on 3/10/18.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation

enum QuestionType: String {
    case flag = "flag"
    case name = "name"
}

class QuestionBuilder {
    
    fileprivate(set) var countries: [Country]
    fileprivate(set) var type: QuestionType
    fileprivate(set) var previousCountryAlpha2: String
    
    init(countries: [Country], type: QuestionType, previousCountryAlpha2: String) {
        self.countries = countries
        self.type = type
        self.previousCountryAlpha2 = previousCountryAlpha2
    }
    
    func build() -> Question {
        let quizedCountry: Country = countries[Int(arc4random_uniform(UInt32(countries.count)))]
        let quizVariants: Set<Country> = generateQuizVariants(with: quizedCountry)
        return Question(quizedCountry: quizedCountry, type: type, answerVariants: quizVariants)
    }
    
    private func generateQuizVariants(with country: Country) -> Set<Country> {
        var quizVariants: Set<Country> = Set<Country>()
        quizVariants.insert(country)
        while quizVariants.count < 5 {
            let index = Int(arc4random_uniform(UInt32(countries.count)))
            if !quizVariants.contains(countries[index]) {
                quizVariants.insert(countries[index])
            }
        }
        return quizVariants
    }
}
