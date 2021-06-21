//
//  UnsplashModel.swift
//  Unslash
//
//  Created by Lucas Parreira on 21/06/21.
//

import Foundation

struct Photo: Identifiable, Codable {
    let id: String
    let alt_description: String?
    let urls: [String:String]
}

class UnsplashData: ObservableObject {
    @Published var photoArray: [Photo] = []
    
    init(){
        loadData()
    }
    
    func loadData(){
        let key = "0ed7a476e89087bb745625b9cb9e4127624391bab09898106f71cb79a82e4b07"
        let url = "https://api.unsplash.com/photos/random/?count=30&client_id=\(key)"
        
        guard let url = URL(string: "\(url)") else { return }
        URLSession.shared.dataTask(with: url){ data, _, _ in
            guard let data = data else { return }
            let result = try! JSONDecoder().decode([Photo].self, from: data)
            DispatchQueue.main.async {
                self.photoArray = result
            }
        }.resume()
        
    }
}
