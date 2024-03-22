//
//  ContentView.swift
//  Hacker-News
//
//  Created by Mert Ozan Lislas on 3/2/24.
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var searchText=""
    
    var filteredPosts:[Post]{
        if searchText.isEmpty {
                   return networkManager.posts
               } else {
                   return networkManager.posts.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
               }
    }
    var body: some View {
    
        NavigationStack{
            VStack {
                Text("H4X0R News")
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                    .padding(.horizontal)
                TextField("Search", text: $searchText)
                        .padding(8)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                List(filteredPosts){post in
                    NavigationLink( destination: DetailView(url: post.url)){
                        HStack{
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                }
                
                
            }
                
            }
            
        .onAppear(perform: {
            networkManager.fetchData()
        })
        
    }
}


#Preview {
    ContentView()
}
