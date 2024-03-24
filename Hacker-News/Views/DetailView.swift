//
//  DetailView.swift
//  Hacker-News
//
//  Created by Mert Ozan Lislas on 3/10/24.
//

import SwiftUI


struct DetailView: View {
    
    let url: String?
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(title)
                .padding()
            WebView(urlString: url)
        })
    }
}

#Preview {
    DetailView(url: "https://www.google.com", title: "Title")
}


