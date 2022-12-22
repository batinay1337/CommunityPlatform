//
//  ViewModel.swift
//  CommunityPlatform
//
//  Created by Batınay Ünsel on 22.12.2022.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var items = [PostModel]()
    let prefixUrl = "http://localhost:3000"
    
    
    
    //MARK: retrieve data
    func fetchPosts() {
        guard let url = URL(string: "\(prefixUrl)/Student") else {
            print("not found url")
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data,res,error) in
            if (error != nil){
                print("error", error?.localizedDescription ?? "")
                return
            }
            
            
            do{
                if let data = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    DispatchQueue.main.async {
                        self.items = result.data
                    }
                } else {
                    print("NO DATA")
                }
                
            
            } catch let JsonError {
                print("fetch json error:", JsonError.localizedDescription)
            }
        }.resume()
    }
}

