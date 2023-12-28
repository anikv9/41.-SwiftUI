//
//  API.swift
//  41. SwiftUI
//
//  Created by ani kvitsiani on 28.12.23.
//

import Foundation

struct Data : Codable, Identifiable {
    var id: Int
    var title: String
    var summary: String
    var fontSize: CGFloat
    
}

@MainActor class SpaceAPI : ObservableObject {
    @Published var news : [Data] = []
    
    func getData(){
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v4/articles/") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [Data(id: 0, title: "error", url: "error", fontSize: 14, imageURL: "error", newsSite: "error", summary: "refresh the page", publishedAt: "error")]
                }
                return
            }
            
            let spaceData = try! JSONDecoder().decode([Data].self, from: data)
            
            DispatchQueue.main.async {
                print("success!")
                self.news = spaceData
            }
        }
    }
}
