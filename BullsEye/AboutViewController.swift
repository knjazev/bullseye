//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Князев Дмитрий on 12/22/20.
//  Copyright © 2020 Dmitry Kniazev. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

   
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.isOpaque = true
        self.webView.backgroundColor = UIColor.white
        
       if let url = Bundle.main.url(
            forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        
        self.webView.isOpaque = true
               self.webView.backgroundColor = UIColor.white
    
          }
        
       
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
