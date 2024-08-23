//
//  File.swift
//  
//
//  Created by aksh gaur on 23/08/24.
//

import PassKit
import SwiftUI
import UIKit


struct AddPassViewRepresentable: UIViewControllerRepresentable {
    
//    var identityId: String
//    var passId: String
//    var provisioningContext: ProvisioningContext
//    var provisioningCoordinator: AccessProvisioningCoordinator
    var vc : PKAddSecureElementPassViewController

    func makeCoordinator() -> Coordinator {
         Coordinator(self)
     }
     
     func makeUIViewController(context: Context) -> PKAddSecureElementPassViewController {
         
         print("Started AE provisionning")
//         let credManagerController = provisioningCoordinator.addToWallet(provisioningContext)
         
//         let credManagerController = CredentialManagerViewController()
//         credManagerController.delegate = context.coordinator
//         credManagerController.presentAddPassVC(identityId: self.identityId, identityMobileCredentialId: self.passId)
         return self.vc
     }
    
    func updateUIViewController(_ uiViewController: PKAddSecureElementPassViewController, context: Context) {
//        uiViewController.presentAddPassVC()
    }
     
     class Coordinator: NSObject, UINavigationControllerDelegate {
         var parent: AddPassViewRepresentable
         
         init(_ credManagerController: AddPassViewRepresentable) {
             self.parent = credManagerController
         }
         
         func viewControllerDidCancel(_ picker: PKAddSecureElementPassViewController) {
             picker.dismiss(animated: true, completion: nil)
         }

     }
}

