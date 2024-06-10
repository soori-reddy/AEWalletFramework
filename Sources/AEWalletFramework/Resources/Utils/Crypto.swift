//
//  Crypto.swift
//  aria-mobile
//
//  Created by Kyle Wiltshire on 4/29/22.
//

import Foundation
import CryptoKit

class Crypto {
    static func sha256(data: Data) -> String {
        let digest = SHA256.hash(data: data)
        
        // TODO: Figure out how to return a base64 encoded string
        let string = digest.map { String(format: "%02hhx", $0) }.joined()
        return string
    }
}
