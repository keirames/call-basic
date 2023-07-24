//
//  CallManager.swift
//  test
//
//  Created by Khang on 23/07/2023.
//

import Foundation
import CallKit

final class CallManager: NSObject, CXProviderDelegate {
    static let shared = CallManager()
    
    func providerDidReset(_ provider: CXProvider) {
    }
    
    let provider = CXProvider(configuration: CXProviderConfiguration())
    let callController = CXCallController()
    
    override init() {
        super.init()
        
        provider.setDelegate(self, queue: nil)
    }
    
    public func reportIncommingCall(id: UUID, name: String){
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: name)
        
        print("run reportIncommingCall")
        provider.reportNewIncomingCall(with: id, update: update) { error in
            if let error = error {
                print(String(describing: error))
            } else {
                print("Call reported")
            }
        }
        
        print("end reportIncommingCall")
    }
    
    public func startCall(id: UUID, name: String) {
        print("run startCall")
        let handle = CXHandle(type: .generic, value: name)
        let action = CXStartCallAction(call: id, handle: handle)
        let transaction = CXTransaction(action: action)
        
        callController.request(transaction) { error in
            if let error = error {
                print(String(describing: error))
            } else {
                print("Call reported")
            }
        }
    }
 
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        print("accept call provider triggered")
        action.fulfill()
        return
    }
}
