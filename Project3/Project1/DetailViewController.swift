//
//  DetailViewController.swift
//  Project1
//
//  Created by yurongde on 16/1/13.
//  Copyright © 2016年 yurongde. All rights reserved.
//

import UIKit
import Social
class DetailViewController: UIViewController {


    @IBOutlet weak var detailImageView: UIImageView!

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
        }
    }
    func shareTapped() {
//        let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
//        presentViewController(vc, animated: true, completion: nil)
        
//        post to twitter or facebook
        let twitterVc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        twitterVc.setInitialText("Look at this greate picture!")
        twitterVc.addImage(detailImageView.image!)
        twitterVc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController(twitterVc, animated: true, completion:nil)
    }
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}

