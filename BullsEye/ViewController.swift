//
//  ViewController.swift
//  BullsEye
//
//  Created by Князев Дмитрий on 12/16/20.
//  Copyright © 2020 Dmitry Kniazev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var targetValue: Int = 0
    var currentValue: Int = 0
    var currentScore = 0
    var score = 0
    var round = 0
   

    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(
          named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(
          top: 0,
          left: 14,
          bottom: 0,
          right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
            let trackLeftResizable = trackLeftImage.resizableImage(
              withCapInsets: insets)
            slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

            let trackRightImage = UIImage(named: "SliderTrackRight")!
            let trackRightResizable = trackRightImage.resizableImage(
              withCapInsets: insets)
            slider.setMaximumTrackImage(trackRightResizable, for: .normal)
       

        
        startNewGame()
       

    }

    @IBAction func startNewGame() {
        score = 0
        round = 0
        newRound()
        let transition = CATransition()
          transition.type = CATransitionType.fade
          transition.duration = 1
          transition.timingFunction = CAMediaTimingFunction(
          name: CAMediaTimingFunctionName.easeOut)
          view.layer.add(transition, forKey: nil)

    }
    
    func newRound(){
       targetValue = Int.random(in: 1...100)
       round += 1
       updateLabels()
    }

    func updateLabels(){
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
        
    }

    @IBAction func showAlert() {
        
        var difference = abs(currentValue - targetValue)
        var message = ""
        let points = 100 - difference
        score += points

        let title: String
        if difference == 0 {
                title = "Perfect!!!"
            score += 100
            message = "\(title). You scored \(points + 100) points"
        }else if difference  < 5 {
            title = "Good"
             message = "\(title). You scored \(points) points"
        }else if difference  > 5 && difference < 10 {
        title = "Not bad."
             message = "\(title). You scored \(points) points"
        }else {
            title = "To bad"
             message = "\(title). You scored \(points) points"
        }
        
//        message = "You scored \(points) points"
        
        
        let alert  = UIAlertController(title: "Difference \(difference) points", message: message, preferredStyle: .alert)
        
        var action = UIAlertAction(title: "OK", style: .default, handler: { _ in
          self.newRound()
        })
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil)
        
        
      
      
    }
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = lroundf(sender.value)
    }
    
    
}

