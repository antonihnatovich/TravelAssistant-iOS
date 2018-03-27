//
//  Question.swift
//  TravelAssistant-iOS
//
//  Created by Anton Ihnatovich on 3/10/18.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation

enum QuizResult: String {
    case correct = "Correct"
    case incorrect = "Incorrect"
}

class Question {
    
    fileprivate(set) var quizedCountry: Country
    fileprivate(set) var type: QuestionType
    fileprivate(set) var result: QuizResult? = nil
    fileprivate(set) var answerVariants: Set<Country>
    
    init(quizedCountry: Country, type: QuestionType, answerVariants: Set<Country>) {
        self.quizedCountry = quizedCountry
        self.type = type
        self.answerVariants = answerVariants
    }
    
    func answered(with result: QuizResult) {
        self.result = result
    }
}
