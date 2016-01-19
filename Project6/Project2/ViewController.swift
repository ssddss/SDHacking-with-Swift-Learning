//
//  ViewController.swift
//  Project2
//
//  Created by yurongde on 16/1/15.
//  Copyright © 2016年 yurongde. All rights reserved.
//

import UIKit
import GameplayKit
class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var currentTimes: UILabel!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var times = 0 /**< 当前的次数*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //一行代码实现
//        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor

        askQuestion(nil)
        updateScoreLabel()
    }
    @IBAction func buttonClick(sender: UIButton) {
        if times == countries.count {
                    let alert = UIAlertController(title: "", message: "Your score is :\(score)", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Confirm", style: .Default, handler: nil))

        
                    presentViewController(alert, animated: true, completion: nil)
            return;
        }
        var status: String
        ++times
        if sender.tag == correctAnswer {
            status = "Correct"
            ++score
        } else {
            status = "Wrong"
            --score
        }
        
        updateScoreLabel()
        askQuestion(nil)
//        let alert = UIAlertController(title: status, message: "Your score is :\(score)", preferredStyle: UIAlertControllerStyle.Alert)
//        alert.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
//        if sender.tag != correctAnswer {
//        
//            alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action: UIAlertAction!) -> Void in
//                print("cancel")
//            }))
//        }
//
//        
//        presentViewController(alert, animated: true, completion: nil)
    }
    func askQuestion(action: UIAlertAction!) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString

        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
    }
    func updateScoreLabel() {
        scoreLabel.text = "分数: \(score)"
        currentTimes.text = "\(times)/\(countries.count)"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

