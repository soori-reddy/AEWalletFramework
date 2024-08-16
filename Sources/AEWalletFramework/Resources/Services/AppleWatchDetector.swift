//
//  File.swift
//  
//
//  Created by aksh gaur on 13/08/24.
//

import WatchConnectivity

final class AppleWatchDetector: NSObject {
    
    static let shared = AppleWatchDetector()
    var session: WCSession?  = nil
    var watchPaired = false
    
    func detect() {
        if(WCSession.isSupported()){
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }else{
            print("WCSession.isSupported()   is false" )
        }
    }
}

extension AppleWatchDetector: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        self.watchPaired = session.isPaired
        /*
        switch activationState {
             case .activated:
                 print("WCSession activated successfully")
             case .inactive:
                 print("Unable to activate the WCSession. Error: \(error?.localizedDescription ?? "--")")
             case .notActivated:
                 print("Unexpected .notActivated state received after trying to activate the WCSession")
             @unknown default:
                 print("Unexpected state received after trying to activate the WCSession")
        }
        */
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("Received application context: \(applicationContext)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
    }
}
