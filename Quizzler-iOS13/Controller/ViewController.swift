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
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var lastChoiceButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        questionLabel.text = quizBrain.getQuestion()
        scoreLabel.text = "Score: 0"
        firstChoiceButton.setTitle(quizBrain.getChoice(0), for: .normal)
        secondChoiceButton.setTitle(quizBrain.getChoice(1), for: .normal)
        lastChoiceButton.setTitle(quizBrain.getChoice(2), for: .normal)
    }
    
    
    @IBAction func answerPressedButton(_ sender: UIButton) {
        
        if quizBrain.userGotItRight(sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
            scoreLabel.text = quizBrain.updateScore()
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        if quizBrain.questionNumber + 1 < quizBrain.quiz.count {
            quizBrain.questionNumber += 1
        }
        else {
            quizBrain.resetUI()
            progressBar.progress = 0.0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        
        questionLabel.text = quizBrain.getQuestion()
        
        firstChoiceButton.setTitle(quizBrain.getChoice(0), for: .normal)
        secondChoiceButton.setTitle(quizBrain.getChoice(1), for: .normal)
        lastChoiceButton.setTitle(quizBrain.getChoice(2), for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        
        firstChoiceButton.backgroundColor = UIColor.clear
        secondChoiceButton.backgroundColor = UIColor.clear
        lastChoiceButton.backgroundColor = UIColor.clear
    }
    
}

