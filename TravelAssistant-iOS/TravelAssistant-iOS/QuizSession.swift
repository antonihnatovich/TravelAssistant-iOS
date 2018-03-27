//
//  QuizSession.swift
//  TravelAssistant-iOS
//
//  Created by Anton Ihnatovich on 3/10/18.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation

class QuizSession {
    
    fileprivate(set) var quizedQuestions: [Question] = [Question]()
    
    fileprivate(set) var roomHelpUsed: Bool = false
    fileprivate(set) var friendCallUsed: Bool = false
    fileprivate(set) var fiftyFiftyUsed: Bool = false
    fileprivate(set) var mistakesCount: Int = 0
    
    func usedRoomHelp() {
        roomHelpUsed = true
    }
    
    func usedFriendCall() {
        friendCallUsed = true
    }
    
    func usedfiftyFifty() {
        fiftyFiftyUsed = true
    }
    
    func doneMistake() {
        mistakesCount += 1
    }
}
