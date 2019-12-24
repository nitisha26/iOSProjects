//
//  ViewController.swift
//  FinalPrjt
//
//  Created by Nitisha on 2019-12-02.
//  Copyright © 2019 CollegeLaSalle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number : Int = 0
    var answer : Bool = false
    var questionBank = Questions()
    var count : Int = 0
    var result : Int = 0
    
     
    @IBOutlet weak var progress: UIProgressView!
      
    @IBOutlet weak var score: UILabel!
  
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var lblAnswer: UILabel!
    override func viewDidLoad() {
    super.viewDidLoad()
       
    lblQuestion.text = questionBank.questions[number].ques
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
       
        if sender.tag == 1{
            answer = true
        }
        else {
            answer = false
        }
        
        if(number <= 9){
            validate()
        }
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination as! SecondVCViewController
       }
    }
    
    
    func restart(){
        number = 0
        lblQuestion.text = questionBank.questions[number].ques;
        lblAnswer.text = "";
        progress.progress = 0.1
        result = 0
        score.text = ""
    }
    
    

    func validate(){
        number += 1
        if (number != 10){
         if(answer == questionBank.questions[number].ans){
            lblAnswer.text = "You are right"
            result += 1
           
        }
        else{
            lblAnswer.text = "You are wrong"
        }
            
            
        progress.progress = progress.progress + 0.1
            
        var timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            self.lblAnswer.text = "";
        }
       
        lblQuestion.text = questionBank.questions[number].ques
        
        }else{
            let alert = UIAlertController(title: "question ", message: "do you want to play again", preferredStyle: UIAlertController.Style.alert)
                               
            let okBtn = UIAlertAction(title: "yes", style: UIAlertAction.Style.default, handler: {(UIAlertAction) in self.restart()})
          
            let fineBtn = UIAlertAction(title: "no", style: UIAlertAction.Style.default, handler: {(UIAlertAction) in self.performSegue(withIdentifier: "second", sender: nil)})
                     
                     alert.addAction(okBtn)
                     alert.addAction(fineBtn)
                     self.present(alert, animated: true , completion: nil)
                     performSegue(withIdentifier: "second", sender: nil)
            
            
        }
        score.text = String(result)
            
        
}
    
  
    
    
    
}


