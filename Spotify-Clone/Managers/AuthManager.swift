//
//  AuthManager.swift
//  Spotify-Clone
//
//  Created by andres holivin on 25/02/22.
//

import Foundation
import UIKit
final class AuthManager{
    static let shared=AuthManager()
    struct Constants{
        static let clientId="32de8fd47c554e01a2bc9ab3ba54cfcd"
        static let clientSecret="644bb149c197402a932330d309e28e9f"
    }
    public var signInURL:URL?{
        let scopes="user-read-private"
        let base="https://accounts.spotify.com"
        let redirectURI="https://iosacademy.io"
        let string="\(base)/authorize?response_type=code&client_id=\(Constants.clientId)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
        
    }
    private init(){}
    var isSignedIn:Bool{
        return false
    }
    private var accessToken:String?{
        return nil
    }
    private var refreshToken:String?{
        return nil
    }
    private var tokenExpirationDate:Date?{
        return nil
    }
    private var shouldRefreshToken:Bool{
        return false
    }
    public func exchenageCodeForToken(
        code:String,
        completion:@escaping((Bool)->Void)){
        
    }
    private func refreshAccessToken(){
        
    }
    private func cacheToken(){
        
    }
}
