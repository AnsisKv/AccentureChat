//
//  InfoViewController.swift
//  AccentureChat
//
//  Created by kvelde.niklavs.ansis on 25/05/2023.
//

import UIKit
import WebKit

class InfoViewController: UIViewController {
    var webView: WKWebView!
    @IBOutlet weak var openWebsite: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
    }
    
    @IBAction func openWebsiteTapped(_sender: UIButton){
        if let url = URL(string: "https://www.github.com/AnsisKv?tab=repositories") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

    
