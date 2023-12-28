//
//  NewsCard.swift
//  41. SwiftUI
//
//  Created by ani kvitsiani on 28.12.23.
//

import SwiftUI

struct NewsCard : UIViewRepresentable {
    func makeUIView(context: Context) -> UITableView {
        <#code#>
    }
    
    func makeCoordinator() -> Coordinator {
        <#code#>
    }
    
    var title: [String]
    var summary: String
    var fontSize : CGFloat
    
    init(title: [String], summary: String, fontSize: CGFloat){
        self.title = title
        self.summary = summary
        self.fontSize = fontSize
    }
    
    func makeCard(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        context.coordinator.parent = self
        uiView.reloadData()
    }
    
    func makeCoordinator() -> () {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        
        var parent: NewsCard
        
        init(parent: NewsCard) {
            self.parent = parent
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            parent.title.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = parent.title[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.font = .systemFont(ofSize: parent.fontSize)
            return cell
            
        }
        
        
    }
    
}

#Preview {
    NewsCard()
}
