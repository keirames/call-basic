//
//  ContentView.swift
//  test
//
//  Created by Khang on 21/07/2023.
//

import SwiftUI

struct ResultView: View {
    var choice: String
    
    var body: some View {
        Text("You chose \(choice)")
    }
}

struct ContentView: View {
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
