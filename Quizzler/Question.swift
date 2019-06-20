//
//  Question.swift
//  Quizzler
//
//  Created by Fouad Adel on 5/6/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let qestionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        
        qestionText = text
        answer = correctAnswer
        
    }
}
