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
    }
    
    private init() {}
    
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
}

