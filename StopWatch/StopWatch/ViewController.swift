//
//  ViewController.swift
//  StopWatch
//
//  Created by Nitisha on 2020-01-21.
//  Copyright © 2020 english. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var timer : Timer?
    var isStarted = false
    var counter = 0.0
    @IBOutlet weak var startStopLabel: UIButton!
    
   
    @IBOutlet weak var timerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @objc func updateTimer(){
        counter += 0.1
        timerLabel.text = String(round(counter*10)/10)
        
        
        
    }

    @IBAction func RestartBtn(_ sender: UIButton) {
        
        counter = 0.0
        timerLabel.text = String(0.0)
        if isStarted{
            timer?.invalidate()
            startStopLabel.setTitle("start", for: .normal)
            isStarted = false
          
        }
    
    
    }
    @IBAction func StarStopBtn(_ sender: UIButton) {
        
        if isStarted{
            
            timer?.invalidate()
            isStarted = false
            startStopLabel.setTitle("START", for: .normal)
          
            
        }
        else{
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isStarted = true
            startStopLabel.setTitle("STOP", for: .normal)
    }
    }
    
}

