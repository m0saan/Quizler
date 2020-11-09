//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        questionLabel.text = quizBrain.quiz[quizBrain.questionNumber].question
        scoreLabel.text = "Score: 0"
    }
    
    
    @IBAction func answerPressedButton(_ sender: UIButton) {
        
        if quizBrain.userGotItRight(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
            scoreLabel.text = quizBrain.updateScore()
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        if quizBrain.questionNumber < quizBrain.quiz.count - 1 {
            quizBrain.questionNumber += 1
            questionLabel.text = quizBrain.getQuestion()
            progressBar.progress = quizBrain.getProgress()
        }
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

