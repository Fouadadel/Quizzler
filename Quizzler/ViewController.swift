//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    var allQuestion = QuestionBank()
    var pickedAnswer = false
    var questionNumber: Int = 0
    var scroe: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            pickedAnswer = true
        }else {
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        
        progressLabel.text = "\(questionNumber+1)/13"
        scoreLabel.text = "\(scroe)"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
      
    }
    
	
    func nextQuestion() {
        
        if questionNumber <= 12 {
            
            questionLabel.text = allQuestion.list[questionNumber].qestionText
            updateUI()
            
        }else {
            // making the pop-up box
            let alert = UIAlertController(title: "End of Quiz!", message: "Wanna start over?", preferredStyle: .alert)
            // adding the restart button
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                
                self.startOver()
            }
            
            alert.addAction(restartAction)
            
            // pop-up the options
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestion.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            // worning pop-up 
            ProgressHUD.showSuccess("Correct!")
            scroe += 1
        }else{
            ProgressHUD.showError("Worng!")
        }
    }
    
    
    func startOver() {
        
        questionNumber = 0
        scroe = 0
        nextQuestion()
    
    }
    

    
}
