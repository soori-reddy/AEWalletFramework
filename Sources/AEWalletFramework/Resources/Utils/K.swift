//
//  K.swift
//  aria-mobile
//
//  Created by Kyle Wiltshire on 4/6/22.
//

import Foundation

/*
    Constants
*/

enum PassName: String {
    case Corporate = "Employee Badge"
    case Hospitality = "Hospitality Key"
    case MFH = "Home Key"
}

struct Product {
    static var Corporate = "corporate"
    static var Hospitality = "hospitality"
    static var MultiFamilyHome = "multifamilyhome"
}

struct Trust {
    static var endpoint = "https://my.example.com:8443"
    // TODO: use base64 encoded hash of server CA public key
    static var hash = "d9418017dfc197d4090dd94d6e14ad0ebd321eb7958da77f7b1f3971a938dd1a"
}
