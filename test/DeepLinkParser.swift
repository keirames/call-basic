//
//  DeepLinkParser.swift
//  test
//
//  Created by Khang on 24/07/2023.
//

import Foundation

protocol DeepLinkParser {
    func canHandleDeepLink(_ urlComponents: URLComponents) -> Bool
    func handleDeepLink(_ urlComponents: URLComponents)
}

