//
//  testApp.swift
//  test
//
//  Created by Khang on 21/07/2023.
//

import SwiftUI

@main
struct testApp: App {
    @Environment(\.openURL) private var openURL

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print("loaded")
                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
//                        let id = UUID()
//                        CallManager.shared.reportIncommingCall(id: id, name: "random sheet")
//                    })
                }
        }
    }
}
