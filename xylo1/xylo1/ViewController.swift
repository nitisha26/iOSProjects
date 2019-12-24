//
//  ViewController.swift
//  xylo1
//
//  Created by Nitisha on 2019-12-19.
//  Copyright © 2019 english. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var audioPlayer : AVAudioPlayer!
     // var selected : String = ""
   let arr = ["note1" , "note2" , "note3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func press(_ sender: UIButton) {
        
        
        playSound(soundFileName : arr[sender.tag-1])
    }
    
    
    func playSound(soundFileName : String){
         
        
        
         let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
         do{
             audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
         }
         catch{
             
             
             print(error)
         }
       audioPlayer.play()
    }
}
 

