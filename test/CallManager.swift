//
//  CallManager.swift
//  test
//
//  Created by Khang on 20/07/2023.
//

import CallKit
import Foundation

final class CallManager: NSObject, CXProviderDelegate {
    let provider = CXProvider(configuration: CXProviderConfiguration())
    let callController = CXCallController()
    
    override init() {
        super.init()
        
        provider.setDelegate(self, queue: nil)
        
    }
    
    public func reportIncommingCall(id: UUID, handle: String) {
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: handle)
        
        provider.reportNewIncomingCall(with: id, update: update) { error in
            if let error = error {
                print(String(describing: error))
            } else {
                print("Call reported")
            }
        }
    }
    
    public func startCall(id: UUID, handle: String) {
        let handle = CXHandle(type: .generic, value: handle)
        let action = CXStartCallAction(call: id, handle: handle)
        let transaction = CXTransaction(action: action)
        
        callController.request(transaction) { error in
            if let error = error {
                print(String(describing: error))
            } else {
                print("Call started")
            }
        }
    }
    
    func providerDidReset(_ provider: CXProvider) {
        
    }
}
