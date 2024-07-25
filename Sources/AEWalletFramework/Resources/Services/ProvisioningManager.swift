//
//  ProvisioningService.swift
//  aria-mobile
//
//  Created by Kyle Wiltshire on 4/7/22.
//

import Foundation
import PassKit

protocol ProvisioningManager {
    func addToWallet(_ context: ProvisioningContext, completion:@escaping (Result<PKAddSecureElementPassViewController,Error>)->Void)
}
