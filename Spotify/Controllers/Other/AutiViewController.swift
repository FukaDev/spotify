//
//  AutiViewController.swift
//  Spotify
//
//  Created by Thais Morimoto on 26/05/1401 AP.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {
    
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        
        return webView
        
    }()

    public var completionHandler: ((Bool) ->Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate = self
        view.addSubview(webView)
        guard let url = AuthManager.shared.signInURL else {
            return
        }
        webView.load(URLRequest(url: url))
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        
        let component = URLComponents(string: url.absoluteString)
        
       
        guard let code = component?.queryItems?.first(where: { $0.name == "code" })?.value else { return }
        
        webView.isHidden = true
        
        print("code: \(code)")
        AuthManager.shared.exchangeCodeForTokeN(code: code) { [weak self] success in
            DispatchQueue.main.async {
            self?.navigationController?.popToViewController(animated: true)
            self?.completionHandler?(success)
            
            }
        }
    }
    
}
