//
//  ViewController.swift
//  Project8
//
//  Created by yurongde on 16/1/19.
//  Copyright © 2016年 yurongde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var cluesLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var currentAnswer: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func submitTapped(sender: UIButton) {
    }
    @IBAction func clearTapped(sender: UIButton) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

