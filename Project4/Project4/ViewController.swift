//
//  ViewController.swift
//  Project4
//
//  Created by yurongde on 16/1/18.
//  Copyright © 2016年 yurongde. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,WKNavigationDelegate {
    var webView: WKWebView!
    var progressView: UIProgressView!
    
    var websites = ["apple.com","hackingwithswift.com","www.baidu.com"]
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: "openTapped")
        progressView = UIProgressView(progressViewStyle: .Default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
         let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .Refresh, target: webView, action: "reload")
        
        toolbarItems = [progressButton,spacer,refresh]
        navigationController?.toolbarHidden = false
        
        let url = NSURL(string: "https://" + websites[0])!
        webView.loadRequest(NSURLRequest(URL: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    func openTapped() {
        let alert = UIAlertController(title: "Open page…", message: nil, preferredStyle: .ActionSheet)
        
        for website in websites {
            alert.addAction(UIAlertAction(title: website, style: .Default, handler: openPage))
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    func refreshTapped() {
        webView.reload()
    }
    func openPage(action: UIAlertAction!) {
        let url = NSURL(string: "https://" + action.title!)!
        webView.loadRequest(NSURLRequest(URL: url))
    }

    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        title = webView.title
    }
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.URL
        
        //检测是否包含安全网站的字符串才可访问
        if  let host = url!.host {
            for website in websites {
                if host.rangeOfString(website) != nil {
                    decisionHandler(.Allow)
                    return
                }
            }
        }
        
        decisionHandler(.Cancel)
    }
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

