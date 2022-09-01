//
//  AuthManager.swift
//  Spotify
//
//  Created by Thais Morimoto on 26/05/1401 AP.
//

import Foundation

final class AuthManager{
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "3d2864e1b0244a95b2f9373a65137879"
        static let clienteSecret = "c48f4bcf81e2456e8a73111419bda04d"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://www.iosacademy.io"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scopes=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
       
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false

    }
    
    private var acessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
        
    }
    
    private var tokenExopirationDate: Date? {
        return nil
    }
    
    private var shouldFreshToken: Bool {
        return false
        
    }
    
    public func exchangeCodeForTokeN(
        code: String,
        completion: @escaping ((Bool) -> Void)
    ) {
        guard let url = URL(string: String: Constanes.tokenAPIURL) else {
            return
        }
        var components = URLComponents()
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: <#T##String?#>)
        ]
        
        
        var request =  URLRequest(url: url)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else { completion (false)
                return
            }
            do {
                let json = JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("SUCCESS: \(json)")
                
            }
            catch {
                print(error.localizedDescription) completion(false)
            }

        }
        }
    }
    public func refreshAccessToken(){
        
    }
    
    private func cacheToken(){
        
    }
    
}

