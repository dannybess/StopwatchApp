//
//  ViewController.swift
//  stopwatch
//
//  Created by Daniel Bessonov on 2/15/17.
//  Copyright © 2017 Dali Labs, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0.0
    var timer = NSTimer()
    var isPlaying = false
    
    @IBOutlet weak var stopwatchLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopwatchLabel.text = String(counter)
        pauseButton.enabled = false
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startPressed(sender: AnyObject) {
        if(isPlaying){
            return
        }
        startButton.enabled = false
        pauseButton.enabled = true
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "UpdateTimer", userInfo: nil, repeats: true)
    }
    
    /* Swift 3 Code -->
    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
    
    Make sure you have a function called UpdateTimer defined so the code runs without error!
    */
    func UpdateTimer(){
        counter += 0.1
        stopwatchLabel.text = String(format: "%.1f", counter)
    }
    
    @IBAction func pausePressed(sender: AnyObject) {
        startButton.enabled = true
        pauseButton.enabled = false
        
        timer.invalidate()
        isPlaying = false
        
    }
    
    @IBAction func resetPressed(sender: AnyObject) {
        startButton.enabled = true
        pauseButton.enabled = false
        
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        stopwatchLabel.text = String(counter)
    }

}

