//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by moboustt on 11/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct Question {
    init(q: String, a : [String], correctAnswer: String) {
        self.question = q
        self.choices = a
        self.answer = correctAnswer
    }
    
    var question: String
    var choices: [String]
    var answer: String
}
