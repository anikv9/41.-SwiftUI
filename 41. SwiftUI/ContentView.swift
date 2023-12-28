//
//  ContentView.swift
//  41. SwiftUI
//
//  Created by ani kvitsiani on 28.12.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fontSize: CGFloat = 14
    @StateObject var api = API()
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            newsList
                .toolbar { textZoomer() }
              
        }
        Form{
            Section {
                Toggle("Volume", isOn: $isActive)
                
                HStack {
                    Text("Volume")
                    Spacer()
                    
                    Text(isActive ? "ON" : "OFF")
                }
                .background(Color.black.opacity(0.001))
            }
        }
    }
    
    
}

private extension ContentView {
    var newsList: some View {
        VStack {
            if api.allNews.isEmpty {
                ProgressView().scaleEffect(2.5)
            } else {
                NewsCard(title: "title", summary: "summary", fontSize: 14)
//                heeeelppp
                    .accessibilityLabel("My news app!")
            }
        }
        .navigationTitle("News")
        .padding()
    }
    
    func textZoomer() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading){
            Menu {
                Button("S") {fontSize = 12 }
                Button("M") {fontSize = 16 }
                Button("L") {fontSize = 20 }
            } label: {
                Label("Font size", systemImage: "textformat.size")

                
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
