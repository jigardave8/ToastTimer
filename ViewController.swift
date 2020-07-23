//
//  ViewController.swift
//  Toast
//
//  Created by jigar on 12/07/20.
//  Copyright © 2020 jigar. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let softTime = 3
    let mediumTime = 4
    let hardTime = 7
    
    let toastTimes = ["Soft":3, "Medium":4, "Hard":7 ]
    
//    var secondsRemaining = 60
    var totalTime = 0
    var secondsPassed = 0
    
    
    
    var timer = Timer()
    var player: AVAudioPlayer!

    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
//        progressBar.progress = 1.0
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = toastTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        //        print(result)
        //        if hardness=="Soft" {
        //            print("softTime")
        //        }
        //
        //        else if hardness =="Medium"{
        //            print("mediumTime")
        //}
        //                                      oR other method
        //        switch hardness {
        //        case "Soft":
        //            print("softTime")
        //        case "Medium":
        //            print("mediumTime")
        //
        //        case "Hard":
        //            print("hardTime")
        //        default:
        //            print("Error")
        //        }
        
        
        
        
    }
    @objc func updateTimer(){
        
        if secondsPassed < totalTime {
            
            secondsPassed += 1

            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            
            
        }
        else {
            timer.invalidate()
            titleLabel.text = "Done"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
