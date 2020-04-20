//
//  Question.swift
//  Quizzler
//
//  Created by Shawn Li on 4/15/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import Foundation

class Question {
    
    let answer: Bool
    let questionText: String
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
    
}
