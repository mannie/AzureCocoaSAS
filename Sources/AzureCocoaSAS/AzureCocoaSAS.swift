import Foundation
import CryptoSwift

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
    
    public static func token(for endpoint: String, using policy: SharedAccessPolicy, lifetime: TimeInterval = 60*60*24*7) throws -> String {
        guard let encodedURI = endpoint.addingPercentEncoding(withAllowedCharacters: .alphanumerics) else {
            throw TokenError.InvalidURI
        }
        
        let expiration = Int(Date().addingTimeInterval(lifetime).timeIntervalSince1970)
        let expiringURI = "\(encodedURI)\n\(expiration)"
        
        guard
            let hmac = try? HMAC(key: policy.key, variant: .sha256).authenticate(expiringURI.bytes),
            let encodedHMAC = Data(bytes: hmac).base64EncodedString().addingPercentEncoding(withAllowedCharacters: .alphanumerics)
        else {
            throw TokenError.HMACFailure
        }
        
        return "SharedAccessSignature sr=\(encodedURI)&sig=\(encodedHMAC)&se=\(expiration)&skn=\(policy.name)"
    }
    
}
