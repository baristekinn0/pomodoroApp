//
//  ViewController.swift
//  pomodoroApp
//
//  Created by Barış Tekin on 24.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var timer = Timer()
    var isTimerStarted = false
    var time = 1500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        startButton.isEnabled = true
        startButton.alpha = 1
        
        
        if !isTimerStarted {
            startTimer()
            isTimerStarted = true
            startButton.setTitle("Pause", for: .normal)
            startButton.setTitleColor(UIColor.red, for: .normal)
            cancelButtonEnabledTrue()
           
        }else{
            timer.invalidate()
            isTimerStarted = false
            startButton.setTitle("Resume", for: .normal)
            startButton.setTitleColor(UIColor.green, for: .normal)
            cancelButtonEnabledTrue()
            
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        cancelButton.isEnabled = false
        cancelButton.alpha = 0.5
        timer.invalidate()
        time = 1500
        isTimerStarted = false
        timeLabel.text = "25.00"
        startButton.setTitle("Start", for: .normal)

    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        time -= 1
        timeLabel.text = formatTime()
    }
    
    func formatTime() -> String{
        
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    func cancelButtonEnabledTrue(){
        cancelButton.isEnabled = true
        cancelButton.alpha = 1
    }
}
