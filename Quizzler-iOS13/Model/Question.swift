//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by moboustt on 11/9/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct Question {
    init(q: String, a : String) {
        self.question = q
        self.answer = a
    }
     var question: String
     var answer: String
}
