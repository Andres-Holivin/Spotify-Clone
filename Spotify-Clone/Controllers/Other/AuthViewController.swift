//
//  AuthViewController.swift
//  Spotify-Clone
//
//  Created by andres holivin on 25/02/22.
//

import UIKit
import WebKit
class AuthViewController: UIViewController,WKNavigationDelegate {
    private let webView : WKWebView = {
        let config=WKWebViewConfiguration()
        let prefs=WKWebpagePreferences()
        prefs.allowsContentJavaScript=true
        config.defaultWebpagePreferences = prefs
        let webView=WKWebView(frame: .zero,configuration: config)
        return webView
    }()
    public var completionHandler:((Bool)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Sign in"
        view.backgroundColor = .systemBackground
        webView.navigationDelegate=self
        view.addSubview(webView)
        guard let url=AuthManager.shared.signInURL else{
            return
        }
        webView.load(URLRequest(url: url))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame=view.bounds
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else{
            return
        }
        guard let code = URLComponents(string: url.absoluteString)?.queryItems?.first(where: {$0.name=="code"})?.value else{
            return
        }
        webView.isHidden=true
        print("code: \(code)")
        AuthManager.shared.exchenageCodeForToken(code: code){
            [weak self]success in
            DispatchQueue.main.sync {
                self?.navigationController?.popViewController(animated: true)
                self?.completionHandler?(success)
            }
        }
    }
}
