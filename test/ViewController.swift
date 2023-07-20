//
//  ViewController.swift
//  test
//
//  Created by Khang on 20/07/2023.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startDemo()
    }

    func startDemo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let callManager = CallManager()
            let id = UUID()
            
            callManager.reportIncommingCall(id: id, handle: "Tom")
        })
    }
}

