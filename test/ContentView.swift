//
//  ContentView.swift
//  test
//
//  Created by Khang on 21/07/2023.
//
// https://betterprogramming.pub/scalable-navigation-with-deep-links-in-swiftui-96cea1764994

import SwiftUI

class MainLinkParser: DeepLinkParser {
    var action: (Int) -> ()
    
    init(action: @escaping (Int) ->()) {
            self.action = action
    }
    
    func canHandleDeepLink(_ urlComponents: URLComponents) -> Bool {
        return true;
    }
    
    func handleDeepLink(_ urlComponents: URLComponents) {
        print(urlComponents)
        action(1)
    }
    
}

struct ResultView: View {
    var choice: String
    
    var body: some View {
        Text("You chose \(choice)")
    }
}

struct ContentView: View {
    @State var selectedTab: String = "Heads"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30, content: {
                Text("Choose 1 link")
                
                NavigationLink {
                    ResultView(choice: "Heads")
                } label: {
                    Text("Choose Heads")
                }
                
                NavigationLink {
                    ResultView(choice: "Tails")
                } label: {
                    Text("Choose Tails")
                }
                
                NavigationLink {
                    ResultView(choice: "Detail")
                } label: {
                    Text("Detail")
                }

            })
            .navigationTitle("navigation")
        }
        .onOpenURL { url in
            print("App was opened via URL: \(url)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
