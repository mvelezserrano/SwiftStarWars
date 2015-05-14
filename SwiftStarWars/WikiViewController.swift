//
//  WikiViewController.swift
//  SwiftStarWars
//
//  Created by Miguel Angel Vélez Serrano on 12/5/15.
//  Copyright (c) 2015 Miguel Ángel Vélez Serrano. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    var model: StarWarsCharacter?
    var firstLoad: Bool?
    
    convenience init (model: StarWarsCharacter) {
        
        self.init(nibName: "WikiViewController", bundle: nil)
        self.model = model
        self.firstLoad = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView?.delegate=self
        self.syncWithModel()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "characterDidChange:",
            name: "newCharacterSelected",
            object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func syncWithModel() {
        if let theURL = self.model?.url {
            self.webView?.loadRequest(NSURLRequest(URL: theURL))
        }
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        //println("Webview didFinishLoad")
        self.firstLoad = false
        self.activityIndicator?.stopAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
        self.activityIndicator?.stopAnimating()
        var messageTitle: String = "Error"
        var message: String = "An error has occurred while loading character wiki. Please, check internet connection."
        var alert: UIAlertView = UIAlertView()
        alert.title = messageTitle
        alert.message = message
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (self.firstLoad == true) {
            return true
        } else {
            return false
        }
    }
    
    func characterDidChange(notification: NSNotification) {
        println("Recibimos la notificación")
        let userInfo:Dictionary<String,StarWarsCharacter!> = notification.userInfo as! Dictionary<String,StarWarsCharacter!>
        
        self.model = userInfo["character"]!
        self.firstLoad = true
        
        // Actualizamos la vista
        self.syncWithModel()
        
    }
}
