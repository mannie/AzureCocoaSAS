//
//  GenerateSAS.swift
//  AzureCocoaSAS
//
//  Created by Mannie Tagarira on 1/25/19.
//  Copyright © 2019 Mannie Tagarira. All rights reserved.
//

import Foundation

public enum AzureCocoaSAS {
    
    public enum TokenError: Error {
        case InvalidURI, HMACFailure
    }
    
    public struct SharedAccessPolicy {
        internal let name: String
        internal let key: String
        
        public init(name: String, key: String) {
            self.name = name
            self.key = key
        }
    }
    
    public static func generateToken(for endpoint: String, using policy: SharedAccessPolicy, lifetime: TimeInterval = 60*60*24*7) throws -> String {
        guard let encodedURI = endpoint.encoded() else {
            throw TokenError.InvalidURI
        }
        
        let expiration = Int(Date().addingTimeInterval(lifetime).timeIntervalSince1970)
        let hmac = "\(encodedURI)\n\(expiration)".hmac(key: policy.key)
        
        guard let encodedHMAC = hmac.encoded() else {
            throw TokenError.HMACFailure
        }

        return "SharedAccessSignature sr=\(encodedURI)&sig=\(encodedHMAC)&se=\(expiration)&skn=\(policy.name)"
    }
    
}

