//
//  ProvisioningAPI.swift
//  aria-mobile
//
//  Created by Kyle Wiltshire on 4/7/22.
//

import Foundation

protocol ProvisioningAPI {
    func preparePassProvisioning(_ context: ProvisioningContext, withCompletion completion: @escaping (ProvisionAPIResponse) -> Void)
}

protocol AppConfigAPI {
    func fetchAppConfig(withCompletion completion: @escaping (AppConfigResponse) -> Void)
}
