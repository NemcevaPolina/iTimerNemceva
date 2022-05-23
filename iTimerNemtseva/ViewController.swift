//
//  ViewController.swift
//  iTimerNemtseva
//
//  Created by iMac on 23.05.2022.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    @IBOutlet weak var ButtonStart: UIButton!
    @IBOutlet weak var ButtonPause: UIButton!
    @IBOutlet weak var ButtonReset: UIButton!
    @IBOutlet weak var ButtonLap: UIButton!
    @IBOutlet weak var TimerCount: UILabel!
  
    @IBAction func buttonStartAction(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdate), userInfo: NSDate(), repeats: true)
        
        ButtonStart.isHidden = true
        ButtonPause.isHidden = false
    }
    
    @IBAction func buttonPauseAction(_ sender: Any) {
        timer.invalidate()
        TimerCount.text = "00:00"
        
        ButtonStart.isHidden = false
        ButtonPause.isHidden = true
    }
    
    @IBAction func buttonResetAction(_ sender: Any) {
    }
    
    @IBAction func buttonLapAction(_ sender: Any) {
    }
    
    // Сейчас таймер считает только секуны на след паре подумать как сделать минуты!!!
    
    @objc func timerUpdate() {
        let elapsed = -(self.timer.userInfo as! NSDate).timeIntervalSinceNow
        if elapsed < 10 {
            TimerCount.text = String(format: "00:0%.0f", elapsed)
        } else if elapsed < 60 {
            TimerCount.text = String(format: "00:%.0f", elapsed)
        } else if elapsed == 60 {
            
            TimerCount.text = String(format: ":0%.0f", elapsed)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ButtonStart.isHidden = false
        ButtonPause.isHidden = true
    }


}


