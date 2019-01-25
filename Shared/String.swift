//
//  String.swift
//  AzureCocoaSAS
//
//  Created by Mannie Tagarira on 1/25/19.
//  Copyright © 2019 Mannie Tagarira. All rights reserved.
//

import Foundation

internal extension String {
    
    internal func hmac(key: String) -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA256), key, key.count, self, self.count, &digest)
        let data = Data(bytes: digest)
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
    internal func encoded() -> String? {
        return addingPercentEncoding(withAllowedCharacters: .alphanumerics)
    }
    
}
