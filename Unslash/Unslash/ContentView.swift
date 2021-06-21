//
//  ContentView.swift
//  Unslash
//
//  Created by Lucas Parreira on 21/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var vm = UnsplashData()
    let column = [
        GridItem(spacing: 2),
        GridItem(spacing: 2),
        GridItem(spacing: 2),
        GridItem(spacing: 2)
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns:column){
                ForEach(vm.photoArray, id: \.id){ photo in
                    WebImage(url: URL(string: photo.urls["thumb"]!))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:100, height: 100)
                        .clipped()
                        
                }
            }.padding(2)
            .navigationTitle("Unsplash Imagem")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
