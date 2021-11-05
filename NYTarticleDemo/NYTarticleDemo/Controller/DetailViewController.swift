//
//  DetailViewController.swift
//  NYTarticleDemo
//
//  Created by Minseok Choi on 10/15/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        let url = URL(string: article?.url ?? "")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
}
